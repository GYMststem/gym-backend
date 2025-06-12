<?php

namespace App\Http\Controllers\Api\Manager;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Center;
use App\Models\User;
use Validator;
use DB;
use App\Models\Package;
use App\Models\RenewPackage;
use Illuminate\Support\Facades\Response;
use App\Models\Billing;
use Carbon\Carbon;
use Hash;
use App\Models\ApplyCoupon;
use App\Models\Coupon;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\MembersPlans;
use App\Models\Address;

class ManagerMemberController extends Controller
{
    public function MemberRegister(Request $request)
    {
        // Custom validation logic 
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:20',
            'surname' => 'required|string|max:20', 
            //'email' => 'nullable|email|unique:users,email',
            'password' => 'nullable|string|min:8',
            'role' => 'nullable|integer', 
            'mobile' => 'required|string|max:15',
            'gym_member_code' => 'nullable|string|max:100',
            'gender' => 'required',
            'image' => 'nullable|max:255', 
            'marital_status' => 'nullable|in:single,married',
            // 'dob' => 'nullable|date|before_or_equal:' . date('Y-m-d', strtotime('-18 years')),
            'visit_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
            // 'joining_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'), 
            'description' => 'nullable|string',
            'remark' => 'nullable|in:1,2',
            'inquiry_mode' => 'nullable|in:1,2,3',  
            'status' => 'nullable|in:1,2',  
            'address' => 'required|string',
            'city_id' => 'required',
            'state_id' => 'required',
            'pincode' => 'required',
            'paid_amount' => 'nullable|gt:0',
            'payable_amount' => 'nullable|gt:0'
        ]); 

        if($request->package_id != null && $request->date_from != null) {
            return response()->json([
                'status' => 0,
                'message' => 'To select a date, please remove the package selection first.', 
            ], 400);
        } 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        
        $package = Package::where('id',$request->package_id)->first(); 
        
        if($request->paid_amount > $package->price)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Paid amount greater than or equal to payable amount', 
            ], 200);
        }
 
        
        //DB::transaction(function () use ($request, $imagePath) {
           DB::transaction(function () use ($request) {
            $GetUser = Auth::user();
            $lastId = User::orderBy('id', 'desc')->whereNot('client_id',0)->first();
            $CheckCenter = DB::table('centers')->where('user_id', $GetUser->id)->first();
            $package = Package::where('id',$request->package_id)->first(); 
            // Add the number of days from the package to the current date
            if($package)
            {
                $endDate = Carbon::now()->addDays($package->no_of_days)->format('Y-m-d') ?? null;
            }
            
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make('Pass@123'),
                'country_code' => $request->input('country_code') ?? '+91',
                'role' => $request->input('role'),
                'center_id' => $CheckCenter->id,
                'mobile_number' => $request->input('mobile'), 
                'gender' => $request->input('gender'),
                //'image' => $imagePath ?? null, 
                'marital_status' => $request->input('marital_status'),
                'date_of_birth' => $request->input('dob'), 
                'joining_date' => $request->input('joining_date'), 
                'anniversary_date' => $request->input('anniversary_date'),
                'description' => $request->input('description'),   
                'status' => $request->input('status'),
                'surname' => $request->surname,
                'shift_id' => $request->shift_id,
                'starting_date' => $request->input('starting_date') ?? Carbon::now()->format('Y-m-d'),
                'end_date' => $request->input('end_date') ?? isset($endDate) ? $endDate : null,
                'client_id' => $lastId->client_id + 1 ?? 0, 
            ]);
            
            // Fetch role name using role ID
            $role = Role::find($request->input('role'));
            if ($role) {
                $user->assignRole($role->name);
            }
            // Create a personal access token for the user
             $token = $user->createToken('auth_token')->plainTextToken;

            // if($request->role == 20)
            // {   

                if($request->apply_coupon_id)
                {
                    
                    $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
 
                    $package = Package::where('id',$request->package_id)->first(); 

                    $discountAmount = $package != null ? ($package->price * $coupon->percentage) / 100 : null; 

                    // dd($discountAmount);
                        
                    $finalPrice = $package != null ? $package->price - $discountAmount : null;  

                    $payble_amount = $finalPrice; 

                    // $billing = Billing::create([
                    //     'user_id' => $user->id,
                    //     'package_id' => $request->package_id,
                    //     'discount_price' => $discountAmount,
                    //     'final_price' => $finalPrice,
                    //     'paid_amount' => $request->paid_amount ?? 0,
                    //     'payable_amount' => $request->payable_amount ?? $payble_amount, 
                    // ]); 
                    
                    $data = [
                        'user_id' => $user->id,
                        'client_id' => $lastId->client_id + 1 ?? null,
                        'center_id' => $CheckCenter->id,
                        'transaction_type' => $request->input('transaction_type') ?? null,
                        'monthly_fee' => $request->input('monthly_fee') ?? null,
                        'discount' => $discountAmount ?? 0,
                        'no_of_moths' => $request->input('no_of_moths') ?? null,
                        'start_date' => $request->input('start_date') ?? null,
                        'receipt_method' => $request->input('receipt_method') ?? null ,
                        'balance' => $finalPrice ?? 0,
                        'amount' => $request->paid_amount ?? 0,
                        'reference' => $request->input('reference') ?? null,
                        'description' => $request->input('description') ?? null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
            
                    // Insert data into the client_billings table
                    $inserted = DB::table('client_billings')->insertGetId($data); 
                    // dd($inserted);
                    $ApplyCoupon = ApplyCoupon::create([
                        'user_id' => $user->id,
                        'package_id' => $request->package_id,
                        'discount_price' => $discountAmount,
                        'final_price' => $finalPrice,
                        'paid_amount' => $request->paid_amount,
                        'coupon_id' => $request->apply_coupon_id,
                        'billing_id' => $inserted,
                        'applied_at' => Carbon::now(), 
                    ]);
                } 
                else
                { 
                  
                    // $billing = Billing::create([
                    //     'user_id' => $user->id,
                    //     'package_id' => $request->package_id ?? null,
                    //     'discount_price' => 0,
                    //     'final_price' => 0,
                    //     'paid_amount' => $request->paid_amount ?? 0,
                    //     'payable_amount' => $request->payable_amount ?? 0, 
                    // ]);  

                    $package = Package::where('id',$request->package_id)->first(); 
                    // dd($package);
                    $data = [
                        'user_id' => $user->id,
                        'client_id' => $lastId->client_id + 1 ?? null,
                        'center_id' => $CheckCenter->id,
                        'transaction_type' => $request->input('transaction_type') ?? null,
                        'monthly_fee' => $request->input('monthly_fee') ?? null,
                        'discount' => $request->input('discount') ?? 0,
                        'no_of_moths' => $request->input('no_of_moths') ?? null,
                        'start_date' => $request->input('start_date') ?? null,
                        'receipt_method' => $request->input('receipt_method') ?? null ,
                        'balance' => $request->payable_amount ?? 0,
                        'amount' => $request->paid_amount ?? 0,
                        'reference' => $request->input('reference') ?? null,
                        'description' => $request->input('description') ?? null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
            
                    // Insert data into the client_billings table
                    $inserted = DB::table('client_billings')->insert($data);
                }   
                    $memberPackage = Package::where('id',$request->package_id)->first();
                    
                    if($request->date_from && $request->date_to)
                    {
                        $dateFrom = Carbon::parse($request->date_from);
                        $dateTo = Carbon::parse($request->date_to);
                        $noOfDays = $dateFrom->diffInDays($dateTo); 
                    } 

                    $membersPlan = new MembersPlans();
                    $membersPlan->user_id = $user->id;
                    $membersPlan->package_id = $request->package_id ?? 0;
                    $membersPlan->package_name = $memberPackage->package_name ?? null;
                    $membersPlan->price = $memberPackage->price ?? $request->manual_price;
                    $membersPlan->center_id = $CheckCenter->id;
                    $membersPlan->no_of_days = $memberPackage->no_of_days ?? null;
                    $membersPlan->product_type = $memberPackage->product_type ?? $request->product_type;
                    $membersPlan->training_type = $memberPackage->training_type ?? $request->training_type;
                    $membersPlan->package_timing = $memberPackage->package_timing ?? $request->package_timing;
                    $membersPlan->package_type = $memberPackage->package_type ?? $request->package_type;
                    $membersPlan->show_at_advicefit_platform = $memberPackage->show_at_advicefit_platform ?? $request->show_at_advicefit_platform;
                    $membersPlan->status = $memberPackage->status ?? $request->packge_status;
                    $membersPlan->date_from = $request->date_from ?? $memberPackage->date_from ?? null;
                    $membersPlan->date_to = $request->date_to ?? $memberPackage->date_to ?? null;
                    $membersPlan->manual_price = $request->manual_price ?? $memberPackage->manual_price ?? null;
                    $membersPlan->membership_type = $memberPackage->membership_type ?? 0;
                    $membersPlan->assigned_users_id = $request->trainer_id ?? 2;
                     
                    $membersPlan->save();

                    // $member = Member::create([
                    //     'user_id' => $user->id,
                    //     'assigned_users_id' => $request->assigned_users_id,
                    //     'package_id' => $request->package_id ?? null,
                    //     'date_from' => $request->date_from,
                    //     'date_to' => $request->date_to,
                    //     'manual_price' => $request->manual_price,
                    //     'membership_type' => $request->package_id  !== null ? 0 : 1
                    // ]); 



                    
                // } 
 
            if($user) { 
                $address = Address::create([
                    'address_first' => $request->address,
                    'address_second' => $request->address_second ?? null,
                    'city_id' => $request->city_id,
                    'state_id' => $request->state_id,
                    'pincode' => $request->pincode,
                    'user_id' => $user->id,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now()
                ]);
            }

            // Optional: Send email with generated password
            // $mailData = [
            //     'title' => 'Password Generated', 
            //     'email' => $user->email,
            //     'password' => $password
            // ];
            // Mail::to($user->email)->send(new UserPasswordMail($mailData));
            
            return response()->json([
                'status' => 1,
                'message' => 'User registered successfully',
                'token' => $token
            ],200);
        }); 
        return response()->json([
            'status' => 1,
            'message' => 'User registered successfully'
        ],200);
    }

    public function GetMemberDetails(Request $request,$user_id = null)
    {
        
        $MemberDetaile= User::where('id',$user_id)->first();
    //dd($user_id);
         
          

        if($user_id !== null)
        {
             // Fetch user details with associated center details
             $UserDetails = User::where('users.id', $user_id) 
             ->join('centers', 'centers.id', 'users.center_id')
             // ->join('roles', 'roles.id', 'users.role')
             ->join('addresses as a', 'a.user_id', 'users.id')
             ->select(
                 'users.*', 
                 'a.city_id as city_name',
                 'a.state_id as state_name',
                 'a.address_first',
                 'centers.name as center_name',
                 'a.address_second',
                 // 'a.address_line_2',
                 'a.pincode'
                 // 'centers.city_id as center_city_name',
                 // 'centers.state_id as center_state_name'
                 // 'roles.name as role_name'
             )
             ->first();

         if ($UserDetails) {
                // Fetch city and state names
                // $UserDetails->city_id = City::where('id', $UserDetails->city_id)->value('name');
                // $UserDetails->state_id = State::where('id', $UserDetails->state_id)->value('name');
                $UserDetails->shift_name = DB::table('shifts')->where('id', $UserDetails->center_id)->value('shift_name');  
                
                $UserDetails->address_first = $UserDetails->address_first.','.$UserDetails->city_name.','.$UserDetails->state_name . ','.$UserDetails->pincode;
                
                // Fetch member details
                $Packages = MembersPlans::where('user_id', $user_id)
                ->select(
                    'id',
                    'package_name',
                    'package_id',
                    'price',
                    'center_id',
                    'no_of_days',
                    'product_type',
                    'training_type',
                    'package_timing',
                    'package_type',
                    'show_at_advicefit_platform',
                    'status',
                    'assigned_users_id as trainer',
                    'membership_type',
                    'date_from',
                    'date_to',
                    'manual_price'
                )
                ->orderBy('id', 'desc')
                ->get();

                
            
            foreach ($Packages as $Package) {
                
                // Fetch the trainer name
                $assignedEmp = User::where('id', $Package->trainer)->first();
                $Package->trainer = $assignedEmp ? $assignedEmp->name : null;

                //  dd($UserDetails->starting_date);
                // Subtract the remaining days from the total no_of_days in the package
                
                // Assuming $UserDetails->starting_date is a valid Carbon date or date string
                $startDate = Carbon::parse($UserDetails->starting_date);

                // Calculate the number of days since the starting date
                $daysPassed = Carbon::now()->diffInDays($startDate);

                // Subtract the days passed from the total no_of_days to get the remaining days
                $remainingDays = $Package->no_of_days - $daysPassed;

                // Ensure the remaining days are not negative
                $Package->remaining_days = $remainingDays > 0 ? $remainingDays : 0;

                // dd($Package->remaining_days);

                
                if( $Package->training_type == 1)
                    {
                        $Package->training_type = 'Without Trainer';
                    }
                    elseif( $Package->training_type == 2)
                    {
                        $Package->training_type = 'With Trainer';
                    }  
    
                    if($Package->package_timing == 1)
                    {
                        $Package->package_timing = \Str::title('normal hours');
                    }
                    elseif($Package->package_timing == 2)
                    {
                        $Package->package_timing = \Str::title('sunny hours');
                    }
    
                    if($Package->package_type == 1)
                    {
                        $Package->package_type = \Str::title('main');
                    }
                    elseif($Package->package_type == 2)
                    {
                        $Package->package_type = \Str::title('add on');
                    }

                // Fetch the renewal packages and their respective coupons
                // $memberRenewPackageFirst = RenewPackage::where('user_id', $user_id)
                //     ->where('package_id', $Package->package_id)
                //     ->whereNotNull('coupon_id')  
                //     ->first(); 
            
                // Fetch the ApplyCoupon information based on the package_id of the current package
                // $ApplyCoupon = ApplyCoupon::where('user_id', $user_id)
                //     ->join('coupons','coupons.id','apply_coupons.coupon_id')
                //     ->where('package_id', $Package->package_id)
                //     ->select(
                //         'apply_coupons.id as apply_coupon_id',
                //         'package_id',
                //         'discount_price',
                //         'final_price',
                //         'coupon_id',
                //         'paid_amount',
                //         'coupons.coupon_name',
                //         'applied_at'
                //     )
                //     ->first();

                    
                    // if ($ApplyCoupon) {
                    //     // Adding the additional key total_amount
                    //     $RemainigPrice = $ApplyCoupon->final_price - $ApplyCoupon->paid_amount;
                    //     $ApplyCoupon->total_amount = $Package->price ?? 0;
                    //     $ApplyCoupon->remaining_price = $RemainigPrice ?? 0;
                    // }


                // Fetch the Billing information based on the package_id of the current package
                $billing = DB::table('client_billings')->where('user_id', $user_id)->first();

                if ($billing) {
                    // Adding the additional key total_amount
                    $RemainigPrice = $Package->price - $billing->amount;
                    $billing->total_amount = $Package->price ?? 0;
                    $billing->remaining_price = $RemainigPrice ?? 0;
                }
 
                $UserDetails->packages = $Package ?? (object)[];
                $UserDetails->billing = $billing ?? (object)[]; 
            } 

                return Response::json([
                    'status' => 1,
                    'message' => 'Get User Details Successfully',
                    'data' => $UserDetails, 
                    
                ]);
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No User Available'
                ], 400);
            }
        }
        else {
             if(!$request->center_id)
             {
                 return response()->json([
                     'status' => 0,
                     'message' => 'User does not exist'
                 ], 200);
             } 
            $userID = DB::table('users')
            ->where('center_id',$request->center_id)
            ->first();
            //   dd($userID);
            // Fetch all users with centers and addresses using DB join
            $AllUsers = DB::table('users')
                ->where('users.center_id',$userID->center_id)
                ->where('client_id','!=',0)
                ->leftJoin('centers', 'centers.id', '=', 'users.center_id')
                ->leftJoin('addresses as a', 'a.user_id', '=', 'users.id')
                ->select(
                    'users.*',
                    'a.city_id as city_name',
                    'a.state_id as state_name',
                    'a.address_first',
                    'centers.name as center_name',
                    'a.address_second',
                    'a.pincode'
                )
                ->get();
    
            // Process each user to include shift, package, and billing details
            foreach ($AllUsers as $user) {
                // Add shift name
                $user->shift_name = DB::table('shifts')->where('id', $user->center_id)->value('shift_name');
                
                // Format the full address
                $user->full_address = $user->address_first . ',' . $user->city_name . ',' . $user->state_name . ',' . $user->pincode;
    
                // Fetch packages for each user
                $Package = DB::table('members_plans')
                    ->where('user_id', $user->id)
                    ->select(
                        'id', 'package_name', 'package_id', 'price', 'center_id', 'no_of_days',
                        'product_type', 'training_type', 'package_timing', 'package_type',
                        'show_at_advicefit_platform', 'status', 'assigned_users_id as trainer',
                        'membership_type', 'date_from', 'date_to', 'manual_price'
                    )
                    // ->orderBy('id', 'desc')
                    ->first();
    
                // foreach ($Packages as $Package) {
                    // dd($Package);
                    // Fetch trainer details and calculate remaining days
                    // $assignedEmp = DB::table('users')->where('id', $Package->trainer)->first();
                    // $Package->trainer = $assignedEmp ? $assignedEmp->name : null;
    
                    // Calculate remaining days
                    $startDate = Carbon::parse($user->starting_date);
                    $daysPassed = Carbon::now()->diffInDays($startDate);
                    $remainingDays = $Package->no_of_days - $daysPassed;
                    $Package->remaining_days = $remainingDays > 0 ? $remainingDays : 0;
    
                    // Modify package details for display
                    $Package->training_type = $Package->training_type == 1 ? 'Without Trainer' : 'With Trainer';
                    $Package->package_timing = $Package->package_timing == 1 ? 'Normal Hours' : 'Sunny Hours';
                    $Package->package_type = $Package->package_type == 1 ? 'Main' : 'Add On';
                // }

                 // Fetch the Billing information based on the package_id of the current package
                 $billing = DB::table('client_billings')->where('user_id', $user->id)
                //  ->where('package_id', $Package->package_id)
                //  ->select(
                //      'billings.id as billing_id',
                //      'package_id',
                //      'discount_price',
                //      'final_price',
                //      'paid_amount',
                //      'payable_amount'
                //  )
                 ->first();

                 if ($billing) {
                    // Adding the additional key total_amount
                    $RemainigPrice = $Package->price - $billing->amount;
                    $billing->total_amount = $Package->price ?? 0;
                    $billing->remaining_price = $RemainigPrice ?? 0;
                }
    
                // Add packages to user
                $user->package = $Package;
                $user->billing = $billing;
    
                // Optionally, you can fetch and attach billing details here
            }
    
            // Return all user data in response
            return Response::json([
                'status' => 1,
                'message' => 'Get All Users Details Successfully',
                'data' => $AllUsers,
            ]);
        
        }
               
    }


    public function UpdateMemberDetaile(Request $request, $user_id = null)
    {
        // Custom validation logic 
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:20',
            'surname' => 'required|string|max:20', 
            'password' => 'nullable|string|min:8',
            'role' => 'nullable|integer', 
            'mobile' => 'required|string|max:15',
            'gym_member_code' => 'nullable|string|max:100',
            'gender' => 'required',
            'image' => 'nullable|max:255', 
            'marital_status' => 'nullable|in:single,married',
            'visit_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
            'description' => 'nullable|string',
            'remark' => 'nullable|in:1,2',
            'inquiry_mode' => 'nullable|in:1,2,3',  
            'status' => 'nullable|in:1,2',  
            'address' => 'required|string',
            'city_id' => 'required',
            'state_id' => 'required',
            'pincode' => 'required',
            'paid_amount' => 'nullable|gt:0'
        ]);
    
        if ($request->package_id != null && $request->date_from != null) {
            return response()->json([
                'status' => 0,
                'message' => 'To select a date, please remove the package selection first.', 
            ], 400);
        } 
    
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        } 
        
        DB::transaction(function () use ($request, $user_id) {
            // Get the logged-in user
            $GetUser = Auth::user();
            $CheckCenter = DB::table('centers')->where('user_id', $GetUser->id)->first();
            $lastId = User::where('id',$user_id)->whereNot('client_id', 0)->first();
            
            // Update the user details
            $user = User::where('id', $user_id)->update([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                // 'password' => $request->input('password') ? Hash::make($request->input('password')) : null,
                // 'country_code' => '+91',
                'role' => $request->input('role'),
                'center_id' => $CheckCenter->id,
                'mobile_number' => $request->input('mobile'),
                'gender' => $request->input('gender'),
                'marital_status' => $request->input('marital_status'),
                'date_of_birth' => $request->input('dob'), 
                'joining_date' => $request->input('joining_date'),
                'anniversary_date' => $request->input('anniversary_date'),
                'description' => $request->input('description'),
                'surname' => $request->input('surname'),
                'shift_id' => $request->input('shift_id'),
                'starting_date' => $request->input('starting_date') ?? Carbon::now()->format('Y-m-d'),
                'end_date' => $request->input('end_date') ?? null,
                'client_id' => $lastId->client_id,
                'status' => $request->input('status')
            ]);
    
            // Handle package and coupon logic
            if ($request->apply_coupon_id) {
                $coupon = Coupon::find($request->apply_coupon_id);
                $package = Package::find($request->package_id);
    
                $discountAmount = ($package && $coupon) ? ($package->price * $coupon->percentage) / 100 : 0;
                $finalPrice = $package ? $package->price - $discountAmount : null;
    
                // Check if billing record exists for the user
                $existingBilling = DB::table('client_billings')
                ->where('user_id', $user_id)
                // ->where('package_id', $request->package_id)
                ->first();

                $billingData = [
                'user_id' => $user_id,
                'client_id' => $lastId->client_id,
                'center_id' => $CheckCenter->id,
                'transaction_type' => $request->input('transaction_type') ?? null,
                'monthly_fee' => $request->input('monthly_fee') ?? null,
                'discount' => $request->input('discount') ?? 0,
                'no_of_moths' => $request->input('no_of_moths') ?? null,
                'start_date' => $request->input('start_date') ?? null,
                'receipt_method' => $request->input('receipt_method') ?? null,
                'balance' => $request->payable_amount ?? 0,
                'amount' => $request->paid_amount ?? 0,
                'reference' => $request->input('reference') ?? null,
                'description' => $request->input('description') ?? null,
                'updated_at' => now(),
                ];

                // If billing record exists, update it
                if ($existingBilling) {
                DB::table('client_billings')
                    ->where('id', $existingBilling->id)
                    ->update($billingData);
                } else {
                // If no billing record exists, insert a new one
                $billingData['created_at'] = now(); // Add created_at field for new records
                $inserted = DB::table('client_billings')->insertGetId($billingData);
                }
    
                ApplyCoupon::create([
                    'user_id' => $user_id,
                    'package_id' => $request->package_id,
                    'discount_price' => $discountAmount,
                    'final_price' => $finalPrice,
                    'paid_amount' => $request->input('paid_amount'),
                    'coupon_id' => $request->apply_coupon_id,
                    'billing_id' => $billingId,
                    'applied_at' => now(),
                ]);
            } else {
                // Insert billing without coupon
                $package = Package::find($request->package_id);
                // Check if billing record exists for the user
                $existingBilling = DB::table('client_billings')
                ->where('user_id', $user_id)
                // ->where('package_id', $request->package_id)
                ->first();

                $billingData = [
                'user_id' => $user_id,
                'client_id' => $lastId->client_id ?? null,
                'center_id' => $CheckCenter->id,
                'transaction_type' => $request->input('transaction_type') ?? null,
                'monthly_fee' => $request->input('monthly_fee') ?? null,
                'discount' => $request->input('discount') ?? 0,
                'no_of_moths' => $request->input('no_of_moths') ?? null,
                'start_date' => $request->input('start_date') ?? null,
                'receipt_method' => $request->input('receipt_method') ?? null,
                'balance' => $request->payable_amount ?? 0,
                'amount' => $request->paid_amount ?? 0,
                'reference' => $request->input('reference') ?? null,
                'description' => $request->input('description') ?? null,
                'updated_at' => now(),
                ];

                // If billing record exists, update it
                if ($existingBilling) {
                DB::table('client_billings')
                    ->where('id', $existingBilling->id)
                    ->update($billingData);
                } else {
                // If no billing record exists, insert a new one
                $billingData['created_at'] = now(); // Add created_at field for new records
                $inserted = DB::table('client_billings')->insertGetId($billingData);
                }

            }
    
            // Update member plan
            if ($request->date_from && $request->date_to) {
                $dateFrom = Carbon::parse($request->date_from);
                $dateTo = Carbon::parse($request->date_to);
                $noOfDays = $dateFrom->diffInDays($dateTo);
            }
    
            MembersPlans::updateOrCreate([
                'user_id' => $user_id,
                'package_id' => $request->package_id
            ], [
                'package_name' => $package->package_name ?? null,
                'price' => $package->price ?? $request->manual_price,
                'center_id' => $CheckCenter->id,
                'no_of_days' => $package->no_of_days ?? null,
                'status' => $package->status ?? $request->package_status,
                'date_from' => $request->date_from ?? null,
                'date_to' => $request->date_to ?? null,
                'manual_price' => $request->manual_price ?? null,
                'membership_type' => $package->membership_type ?? 0,
                'assigned_users_id' => $request->trainer_id ?? 2,
            ]);
    
            // Save address
            Address::updateOrCreate([
                'user_id' => $user_id
            ], [
                'address_first' => $request->address,
                'address_second' => $request->address_second ?? null,
                'city_id' => $request->city_id,
                'state_id' => $request->state_id,
                'pincode' => $request->pincode,
                'updated_at' => now()
            ]);
        });
    
        return response()->json([
            'status' => 1,
            'message' => 'Member Profile Updated successfully'
        ], 200);
    }
    
     
}
