<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Response;
use App\Models\Center;
use App\Models\User;
use App\Models\Package;
use App\Models\Billing;
use App\Models\Subscription;
use App\Models\Address;
use App\Models\City;
use App\Models\State;
use Auth;
use Hash;
use Carbon\Carbon;
use App\Models\Member;
use App\Models\MembersPlans;
use App\Models\ApplyCoupon;
use App\Models\Coupon;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\RenewPackage; 
use App\Models\Expenses;
use Carbon\CarbonPeriod;
use Illuminate\Support\Str;
use Mail;
// use App\Mail\UserPasswordMail;



class UserController extends Controller
{
    //

    public function userRegister(Request $request)
    {

        // Custom validation logic 
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'surname' => 'required', 
            //'email' => 'nullable|email|unique:users,email',
            'password' => 'nullable|string|min:8',
             'role' => 'required',
            // 'center_id' => 'required|integer',
            'mobile' => 'required',
            'gym_member_code' => 'nullable|string|max:100',
            'gender' => 'required',
            'image' => 'nullable|max:255',
            'occupation_id' => 'nullable|integer',
            'marital_status' => 'nullable|in:single,married',
            // 'dob' => 'nullable|date|before_or_equal:' . date('Y-m-d', strtotime('-18 years')),
            'visit_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
            // 'joining_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
            'anniversary_date' => 'nullable|date',
            'tentative_joining_date' => 'nullable|date',
            'description' => 'nullable|string',
            'remark' => 'nullable|in:1,2',
            'inquiry_mode' => 'nullable|in:1,2,3',
            'source_id' => 'nullable|integer',
            'employee_id_proof' => 'nullable|string|max:255',
             'status' => 'nullable|in:1,2', 
            //'api_key' => 'required| in:1',
            //'address' => 'string',
            // 'city_id' => 'required',
            // 'state_id' => 'required',
            // 'pincode' => 'required',
        ]);

  

    
         
        // $validator->sometimes('package_id', 'required', function ($input) {
        //     return $input->role == 20;
        // });

        if($request->package_id != null && $request->date_from != null) {
            return response()->json([
                'status' => 0,
                'message' => 'To select a date, please remove the package selection first.', 
            ], 400);
        } 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        
     
        
        

        

        //DB::transaction(function () use ($request, $imagePath) {
           DB::transaction(function () use ($request) {
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make('Pass@123'),
                'country_code' => '+44',
                'role' =>  null,
                'center_id' => $request->input('center_id') ?? 1,
                'mobile_number' => $request->input('mobile'),
                'gym_member_code' => $request->input('gym_member_code'),
                'gender' => $request->input('gender'),
                //'image' => $imagePath ?? null,
                'occupation_id' => $request->input('occupation_id'),
                'marital_status' => $request->input('marital_status'),
                'date_of_birth' => $request->input('dob'),
                'visit_date' => $request->input('visit_date'),
                'joining_date' => $request->input('joining_date'),
                'tentative_joining_date' => $request->input('tentative_joining_date'),
                'anniversary_date' => $request->input('anniversary_date'),
                'description' => $request->input('description'),
                'remark' => $request->input('remark'),
                'inquiry_mode' => $request->input('inquiry_mode'),
                'source_id' => $request->input('source_id'),
                'employee_id_proof' => $request->input('employee_id_proof'),
                'status' => $request->input('status') ?? 0,
                'surname' => $request->surname,
                'shift_id' => $request->shift_id,
                'starting_date' => $request->input('starting_date'),
                'end_date' => $request->input('end_date'),
                'client_id' => $request->input('client_id') ?? 0,
                'created_by' => Auth::user()->id ?? 1,
                
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

                // if($request->apply_coupon_id)
                // {
                          
                //     $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
 
                //     $package = Package::where('id',$request->package_id)->first(); 

                //     $discountAmount = $package != null ? ($package->price * $coupon->percentage) / 100 : null; 
                        
                //     $finalPrice = $package != null ? $package->price - $discountAmount : null;  

                //     $payble_amount = $finalPrice; 

                    // $billing = Billing::create([
                    //     'user_id' => $user->id,
                    //     'package_id' => $request->package_id,
                    //     'discount_price' => $discountAmount,
                    //     'final_price' => $finalPrice,
                    //     'paid_amount' => $request->paid_amount ?? 0,
                    //     'payable_amount' => $request->payable_amount ?? $payble_amount, 
                    // ]); 
                    
                    //  $data = [
                    //     'user_id' => $user->id,
                    //     'client_id' => $request->input('client_id') ?? null,
                    //     'transaction_type' => $request->input('transaction_type') ?? null,
                    //     'monthly_fee' => $request->input('monthly_fee') ?? null,
                    //     'discount' => $discountAmount ?? 0,
                    //     'no_of_moths' => $request->input('no_of_moths') ?? null,
                    //     'start_date' => $request->input('start_date') ?? null,
                    //     'receipt_method' => $request->input('receipt_method') ?? null ,
                    //     'balance' => $finalPrice ?? 0,
                    //     'amount' => $request->paid_amount ?? 0,
                    //     'reference' => $request->input('reference') ?? null,
                    //     'description' => $request->input('description') ?? null,
                    //     'created_at' => now(),
                    //     'updated_at' => now(),
                    // ];
            
                    // Insert data into the client_billings table
                //     $inserted = DB::table('client_billings')->insertGetId($data);

                //     $ApplyCoupon = ApplyCoupon::create([
                //         'user_id' => $user->id,
                //         'package_id' => $request->package_id,
                //         'discount_price' => $discountAmount,
                //         'final_price' => $finalPrice,
                //         'paid_amount' => $request->paid_amount,
                //         'coupon_id' => $request->apply_coupon_id,
                //         'billing_id' => $inserted,
                //         'applied_at' => Carbon::now(), 
                //     ]);
                // } 
                // else
                // { 
                  
                    // $billing = Billing::create([
                    //     'user_id' => $user->id,
                    //     'package_id' => $request->package_id ?? null,
                    //     'discount_price' => 0,
                    //     'final_price' => 0,
                    //     'paid_amount' => $request->paid_amount ?? 0,
                    //     'payable_amount' => $request->payable_amount ?? 0, 
                    // ]);  
                    
                    // dd($package);
                    
                //      $package = Package::where('id',$request->package_id)->first(); 
                     
                //     $data = [
                //         'user_id' => $user->id,
                //         'client_id' => $request->input('client_id') ?? null,
                //         'transaction_type' => $request->input('transaction_type') ?? null,
                //         'monthly_fee' => $request->input('monthly_fee') ?? null,
                //         'discount' => $request->input('discount') ?? 0,
                //         'no_of_moths' => $request->input('no_of_moths') ?? null,
                //         'start_date' => $request->input('start_date') ?? null,
                //         'receipt_method' => $request->input('receipt_method') ?? null ,
                //         'balance' => $package->price ?? 0,
                //         'amount' => $request->paid_amount ?? 0,
                //         'reference' => $request->input('reference') ?? null,
                //         'description' => $request->input('description') ?? null,
                //         'created_at' => now(),
                //         'updated_at' => now(),
                //     ];
            
                //     // Insert data into the client_billings table
                //     $inserted = DB::table('client_billings')->insert($data);
                // } 
 
                    // $memberPackage = Package::where('id',$request->package_id)->first();
                    
                    // if($request->date_from && $request->date_to)
                    // {
                    //     $dateFrom = Carbon::parse($request->date_from);
                    //     $dateTo = Carbon::parse($request->date_to);
                    //     $noOfDays = $dateFrom->diffInDays($dateTo); 
                    // } 

                    // $membersPlan = new MembersPlans();
                    // $membersPlan->user_id = $user->id;
                    // $membersPlan->package_id = $request->package_id ?? 0;
                    // $membersPlan->package_name = $memberPackage->package_name ?? null;
                    // $membersPlan->price = $memberPackage->price ?? $request->manual_price;
                    // $membersPlan->center_id = $request->center_id ?? 1;
                    // $membersPlan->no_of_days = $memberPackage->no_of_days ?? null;
                    // $membersPlan->product_type = $memberPackage->product_type ?? $request->product_type;
                    // $membersPlan->training_type = $memberPackage->training_type ?? $request->training_type;
                    // $membersPlan->package_timing = $memberPackage->package_timing ?? $request->package_timing;
                    // $membersPlan->package_type = $memberPackage->package_type ?? $request->package_type;
                    // $membersPlan->show_at_advicefit_platform = $memberPackage->show_at_advicefit_platform ?? $request->show_at_advicefit_platform;
                    // $membersPlan->status = $memberPackage->status ?? $request->packge_status;
                    // $membersPlan->date_from = $request->date_from ?? $memberPackage->date_from ?? null;
                    // $membersPlan->date_to = $request->date_to ?? $memberPackage->date_to ?? null;
                    // $membersPlan->manual_price = $request->manual_price ?? $memberPackage->manual_price ?? null;
                    // $membersPlan->membership_type = $memberPackage->membership_type ?? 0;
                    // $membersPlan->assigned_users_id = $request->trainer_id ?? 2;
                     
                    // $membersPlan->save();

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


    public function userLoginWithEmailAndPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => [
                'required',
                // Add custom password strength validation rules here
                'min:8', // Minimum length 
                'not_regex:/\s/', // No whitespace allowed
            ],
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $credentials = $request->only('email', 'password');

        $user = User::where('email', $credentials['email'])->first();

        if (!$user) {
            return response()->json([
                'status' => 0,
                'message' => 'User not found. Please check your email address.',
            ], 404);
        }

        if (Auth::attempt($credentials)) {
            $user = Auth::user(); 


            // Delete existing tokens
             //$user->tokens()->delete();
  
            $token = $user->createToken('auth_token')->plainTextToken;

            Auth::login($user);
            
            $getPermission = DB::table('role_has_permissions')
            ->join('permissions', 'permissions.id','role_has_permissions.permission_id')
            ->select('id','name as permission_name')
            ->where('role_id',$user->role)->get();
           
            $user->permission = $getPermission;

            return response()->json([
                'status' => 1,
                'message' => 'User logged in successfully',
                'api_token' => $token,
                'data' => [
                    'user' => $user
                ]
            ]);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid email or password. Please check your credentials.',
            ],400);
        }
    }
    
    
    public function forgotPassword(Request $request){
        
        // return view('emails.forgetPassword');
       // Optional: Send email with generated password
       $userDetails = User::where('email',$request->email)->first();
    //   return $userDetails;
       if(!empty($userDetails)){
           $password =Str::random(8);
        //   return $password;
           $hashPassword =Hash::make($password);
           User::where('id',$userDetails->id)->update(['password' => $hashPassword]);
            $mailData = [
                'title' => 'Password Generated', 
                'email' => $userDetails->email,
                'password' => $password
            ];
            // Mail::to($request->email)->send(new UserPasswordMail($mailData));
             Mail::send('emails.forgetPassword', $mailData, function($message) use($request){

              $message->to($request->email);

              $message->subject('Reset Password');

          });
            return 'done';
            
       }
           
    }


     public function GetUsers(Request $request)
    {

        

        // $validator = Validator::make($request->all(), [
        //     'api_key' => 'required| in:1'
        // ]); 
        
      

        // if ($validator->fails()) {
        //     return response()->json([
        //         'status' => 0,
        //         'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
        //     ], 422);
        // } 
        
        $userData = [];
        if ($request->user_id) {
            // Fetch user details with associated center details
            $UserDetails = User::where('users.id', $request->user_id) 
                // ->join('centers', 'centers.id', 'users.center_id')
                // ->join('roles', 'roles.id', 'users.role')
                ->join('addresses as a', 'a.user_id', 'users.id')
                 ->select(
                    'users.*', 
                    'a.*'
                    // 'a.state_id as state_name',
                    // 'a.address_first',
                    // // 'centers.name as center_name',
                    // 'address_line_1',
                    // 'address_line_2',
                    // 'a.pincode',
                    // 'centers.city_id as center_city_name',
                    // 'centers.state_id as center_state_name'
                    // 'roles.name as role_name'
                )
                ->first();
  
            if ($UserDetails) {
                 
                // Fetch city and state names
                // $UserDetails->city_id = City::where('id', $UserDetails->city_id)->value('name');
                // $UserDetails->state_id = State::where('id', $UserDetails->state_id)->value('name');
                $UserDetails->shift_name = DB::table('shifts')->where('id', $UserDetails->shift_id)->value('shift_name'); 
                
                 
                $UserDetails->remaining_days = Carbon::parse($UserDetails->starting_date)->diffInDays(Carbon::parse($UserDetails->end_date), false);
                
                 
                 // Fetch member details
                 $Packages = MembersPlans::where('user_id', $request->user_id)
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
                 $memberRenewPackageFirst = RenewPackage::where('user_id', $request->user_id)
                     ->where('package_id', $Package->package_id)
                     ->whereNotNull('coupon_id')  
                     ->first(); 
             
                 // Fetch the ApplyCoupon information based on the package_id of the current package
                 $ApplyCoupon = ApplyCoupon::where('user_id', $request->user_id)
                    ->join('coupons','coupons.id','apply_coupons.coupon_id')
                     ->where('package_id', $Package->package_id)
                     ->select(
                         'apply_coupons.id as apply_coupon_id',
                         'package_id',
                         'discount_price',
                         'final_price',
                         'coupon_id',
                         'paid_amount',
                         'coupons.coupon_name',
                         'applied_at'
                     )
                     ->first();
                     
                     if ($ApplyCoupon) {
                        // Adding the additional key total_amount
                        $RemainigPrice = $ApplyCoupon->final_price - $ApplyCoupon->paid_amount;
                        $ApplyCoupon->total_amount = $Package->price ?? 0;
                        $ApplyCoupon->remaining_price = $RemainigPrice ?? 0;
                    }


                 // Fetch the Billing information based on the package_id of the current package
                 $billing = Billing::where('user_id', $request->user_id)
                 ->where('package_id', $Package->package_id)
                 ->select(
                     'billings.id as billing_id',
                     'package_id',
                     'discount_price',
                     'final_price',
                     'paid_amount',
                     'payable_amount'
                 )
                 ->first();

                 if ($billing) {
                    // Adding the additional key total_amount
                    $RemainigPrice = $Package->price - $billing->paid_amount;
                    $billing->total_amount = $Package->price ?? 0;
                    $billing->remaining_price = $RemainigPrice ?? 0;
                }
                    
             
                 // Fetch the renewal packages and their respective coupons
                 $memberRenewPackage = RenewPackage::where('user_id', $request->user_id)
                     ->where('package_id', $Package->package_id)
                    //  ->whereNotNull('coupon_id')
                     ->select(
                         'user_id',
                         'package_id',
                         'renew_start_date',
                         'renew_end_date',
                         'renew_no_of_days',
                         'coupon_id'
                     )
                     ->orderBy('id', 'desc')
                     ->get();
             
                 // Add renewal package and associated coupon information to each renewal package
                 foreach ($memberRenewPackage as $renewPackage) {
                     $renewApplyCoupon = ApplyCoupon::where('user_id', $renewPackage->user_id)
                         ->where('package_id', $renewPackage->package_id) 
                         ->select(
                             'apply_coupons.id as apply_coupon_id',
                             'package_id',
                             'discount_price',
                             'final_price',
                             'coupon_id',
                             'paid_amount',
                             'applied_at'
                         )
                         ->first();
                        
                     $renewPackage->coupon = $renewPackage->coupon_id != null ?  $renewApplyCoupon : (object)[];
                 }
             
                 // Assign the ApplyCoupon information and renewal packages to the package
                 $Package->billing = $billing ?? (object)[];
                 $Package->coupon = $memberRenewPackageFirst == null ? $ApplyCoupon : (object)[];
                 $Package->renew_package = $memberRenewPackage ?? collect();
                 
                 if ($Package) {  
                    
                    $UserDetails['package'] = $Packages;
                    $UserDetails['member'] = $members ?? '';
                    // $UserDetails['custom_package'] =  $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
                    // $Package['coupon'] = $ApplyCoupon ?? (object)[];
                    $UserDetails['permission'] = $role_has_permissions ?? ''; 
                } else { 
                    $UserDetails['package'] = (object)[];
                    // $UserDetails['custom_package'] = $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
                    $UserDetails['member'] = $members;
                    // $Package['coupon'] = $ApplyCoupon ?? (object)[];
                    $UserDetails['permission'] = $role_has_permissions; 
                }
             }

                    // dd($Packages);
                    $manualPackage = Member::where('user_id', $request->user_id) 
                    ->select(
                        'user_id',
                        'assigned_users_id',
                        'package_id',
                        'date_from',
                        'date_to',
                        'manual_price',
                        'membership_type' 
                    )
                    ->first();

                    if($manualPackage)
                    {
                        $assignMemberName = User::where('id',$manualPackage->assigned_users_id)
                        ->select('users.name')
                        ->first();
                        
                        $manualPackage['trainer'] = $assignMemberName->name;
                       
                    }
             
                   
                

                $role_has_permissions = DB::table('role_has_permissions')
                ->where('role_id',$UserDetails->role)
                ->join('permissions','permissions.id','role_has_permissions.permission_id')
                ->select('role_has_permissions.permission_id', 'permissions.name')
                ->get();

                $assignMember = DB::table('members_plans')
                ->where('assigned_users_id',$request->user_id) 
                ->get();

                
                
 
                $userIds = $assignMember->pluck('user_id')->toArray();
                
                $members = User::whereIn('id', $userIds)->select('users.id as user_id','users.name')->get();

                
                 
                
    
                $userData = $UserDetails;
                return Response::json([
                    'status' => 1,
                    'message' => 'Get User Details Successfully',
                    'data' => $userData
                ]);
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No User Available'
                ], 400);
            }
        } else {
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 100; // Items per page

            // Fetch all users
            // $users = User::where('role', '!=', 1)
            // ->where('role',20)
            // ->paginate($limit, ['*'], 'page', $page);

            $users = DB::table('users')
            // ->where('role', '!=', 1)
            ->where('client_id', '!=',0)
            // ->orWhereNull('role') 
            ->whereNull('deleted_at')
            ->latest()
            ->paginate($limit, ['*'], 'page', $page);
            
             
             // Prepare data for CSV export
            $csvData = [];
            $csvData[] = ['S.No', 'Name', 'Mobile', 'Gender', 'Joining Date']; // CSV headers

            foreach ($users as $item) {
                $csvData[] = [
                    $item->client_id,
                    $item->name,
                    $item->mobile_number,
                    $item->gender,
                    $item->joining_date, 
                ]; 
            }
        
            // Generate CSV content
            $csvFileName = 'expire_in_seven_days.csv';
            $csvFilePath = public_path('downloads/' . $csvFileName); // Save in public/downloads

            // Create the directory if it doesn't exist
            if (!file_exists(public_path('downloads'))) {
                mkdir(public_path('downloads'), 0777, true);
            }

            $file = fopen($csvFilePath, 'w');
            foreach ($csvData as $line) {
                fputcsv($file, $line); // Write each line to CSV
            }
            fclose($file);

            // Generate download link
            $csvDownloadLink = url('public/downloads/' . $csvFileName);

            // Excel file generation (Using HTML Table)
            $excelFileName = 'expire_in_seven_days.xls';
            $excelFilePath = public_path('downloads/' . $excelFileName);

            // Create Excel content using an HTML table
            $excelData = '<table border="1">
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Gender</th>
                    <th>Joining Date</th>
                </tr>';

            // Add data rows for Excel
            foreach ($users as $item) {
                $excelData .= '<tr>';
                $excelData .= '<td>' . $item->client_id . '</td>';
                $excelData .= '<td>' . $item->name . '</td>';
                $excelData .= '<td>' . $item->mobile_number . '</td>';
                $excelData .= '<td>' . $item->gender . '</td>';
                $excelData .= '<td>' . $item->joining_date . '</td>';
                $excelData .= '</tr>';
            }

            $excelData .= '</table>';

            // Save the Excel file
            file_put_contents($excelFilePath, $excelData);

            // Generate Excel download link
            $excelDownloadLink = url('public/downloads/' . $excelFileName);
            
            
            // dd($users);
            $TotalUsers = User::
                // where('role', '!=', 1)
            orWhereNull('role')
            ->count();

            $search = $request->search; 

            $clientSearch = User::where('client_id', '!=', 0)
            ->where(function($query) use ($search) {
                $query->where(DB::raw("CONCAT(name, ' ', surname)"), 'LIKE', "%$search%")
                    ->orWhere('mobile_number', 'LIKE', "%$search%");
            })
            ->get();
            
            if($clientSearch->isEmpty())
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'No Data Found', 
                ],200);
            } 

            // Loop through each user to calculate and add remaining days
            foreach ($clientSearch as $user) {

            

                // Retrieve client billing details
                $ClientBilling = DB::table('client_billings')
                    ->where('user_id', $user->id)
                    ->get();

                $totalRemainingDays = 0;
                $remainingDays = 0;

                foreach ($ClientBilling as $index => $clientBill) {

               
                    $packageName = DB::table('packages')
                    ->where('id', $clientBill->package_id)
                    ->value('package_name');
                   $user->packageName = $packageName ?? null;
 
                    $clientTotalDebit = 0;
                    $clientTotalcredit= 0;
                    $clientRemainigBalance =0; 

                    
                    $clientTotalDebit += $clientBill->amount;
                   
                    $clientTotalcredit += $clientBill->balance;
                   
                    $clientRemainigBalance = $clientTotalcredit - $clientTotalDebit ;
                    
                    $user->client_total_debit = $clientTotalDebit ?? 0;
                    $user->client_total_credit = $clientTotalcredit ?? 0;
                    $user->remaining_balance = $user->client_total_credit - $user->client_total_debit ?? 0; 
                
                    // Calculate remaining days for each package
                    $remainingDays = Carbon::now()->diffInDays(Carbon::parse($clientBill->end_date), false);

                    if ($index === 0) {
                        // Allow negative days for the first package if needed
                        $remainingDays = ($remainingDays < 0) ? $remainingDays : max(0, $remainingDays);
                    } else {
                        // For subsequent packages, ensure non-negative days
                        $remainingDays = max(0, Carbon::parse($clientBill->start_date)->diffInDays(Carbon::parse($clientBill->end_date), false));
                        $totalRemainingDays += $remainingDays;
                    }
                }

                // Final check to set remaining days
                if ($remainingDays < 0) {
                    $user->remaining_days = $remainingDays; // Keep negative if needed
                } else {
                    $user->remaining_days = max(0, $totalRemainingDays + $remainingDays);
                }
            }
 
    
            foreach ($users as $user) {
                // Fetch city and state names
 
             
                 $UserDetails = User::where('users.id', $user->id) 
                ->leftjoin('centers', 'centers.id', 'users.center_id')
                // ->join('client_billings', 'users.id', 'client_billings.user_id')
                ->join('addresses as a', 'a.user_id', 'users.id')
                ->select(
                    'users.*', 
                    'centers.name as center_name',
                    'a.city_id as city_name',
                    'a.state_id as state_name',
                    'a.address_first',
                    'address_line_1',
                    'address_line_2',
                    'a.pincode',
                    'centers.city_id as center_city_id',
                    'centers.state_id as center_state_id'
                    // 'client_billings.end_date'
                    // 'roles.name as role_name'
                )
                ->first();
                
                if($UserDetails)
                {
                    // Fetch city and state names
                // $UserDetails->city_id = City::where('id', $UserDetails->city_id)->value('name');
                // $UserDetails->state_id = State::where('id', $UserDetails->state_id)->value('name');
              
                $UserDetails->packageName ='';
    
                // Fetch member details
                // Fetch member details
                
                $Packages = MembersPlans::where('user_id', $user->id)
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
                    'manual_price',
                    'renew_start_date',
                    'renew_end_date'
                )
                ->orderBy('id', 'desc')
                ->get(); 

                foreach ($Packages as $key =>$Package) {
                    // Fetch the trainer name
                    if($key ==0){
                        //$UserDetails->packageName =$Package->package_name;
                    }
                    $assignedEmp = User::where('id', $Package->trainer)->first();
                    $Package->trainer = $assignedEmp ? $assignedEmp->name : null;

                    $centerName = \DB::table('centers')->where('id',$Package->center_id)->first(); 
                    $Package->center_name = $centerName->name ?? null;
    
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
    

                    $memberRenewPackageFirst = RenewPackage::where('user_id', $user->id)
                    ->where('package_id', $Package->package_id)
                    ->whereNotNull('coupon_id')  
                    ->first(); 
                
                    // Fetch the ApplyCoupon information based on the package_id of the current package
                    $ApplyCoupon = ApplyCoupon::where('user_id', $user->id)
                        ->join('coupons','coupons.id','apply_coupons.coupon_id')
                        ->where('package_id', $Package->package_id)
                        ->select(
                            'apply_coupons.id as apply_coupon_id',
                            'package_id',
                            'discount_price',
                            'final_price',
                            'coupon_id',
                            'paid_amount',
                            'coupons.coupon_name',
                            'applied_at'
                        )
                        ->first();
                        
                        if ($ApplyCoupon) {
                            // Adding the additional key total_amount
                            $RemainigPrice = $ApplyCoupon->final_price - $ApplyCoupon->paid_amount;
                            $ApplyCoupon->total_amount = $Package->price ?? 0;
                            $ApplyCoupon->remaining_price = $RemainigPrice ?? 0;
                        }


                     // Fetch the Billing information based on the package_id of the current package
                     $billing = Billing::where('user_id', $user->id)
                     ->where('package_id', $Package->package_id)
                     ->select(
                         'billings.id as billing_id',
                         'package_id',
                         'discount_price',
                         'final_price',
                         'paid_amount',
                         'payable_amount'
                     )
                     ->first();

                     if ($billing) {
                        // Adding the additional key total_amount
                        $RemainigPrice = $Package->price - $billing->paid_amount;
                        $billing->total_amount = $Package->price ?? 0;
                        $billing->remaining_price = $RemainigPrice ?? 0;
                    }
                
                    // Fetch the renewal packages and their respective coupons
                    $memberRenewPackage = RenewPackage::where('user_id', $user->id)
                        ->where('package_id', $Package->package_id)
                       //  ->whereNotNull('coupon_id')
                        ->select(
                            'user_id',
                            'package_id',
                            'renew_start_date',
                            'renew_end_date',
                            'renew_no_of_days',
                            'coupon_id'
                        )
                        ->orderBy('id', 'desc')
                        ->get();

                    
                
                    // Add renewal package and associated coupon information to each renewal package
                    foreach ($memberRenewPackage as $renewPackage) {
                        $renewApplyCoupon = ApplyCoupon::where('user_id', $renewPackage->user_id)
                            ->where('package_id', $renewPackage->package_id) 
                            ->select(
                                'apply_coupons.id as apply_coupon_id',
                                'package_id',
                                'discount_price',
                                'final_price',
                                'coupon_id',
                                'applied_at'
                            )
                            ->first();
                           
                        $renewPackage->coupon = $renewPackage->coupon_id != null ?  $renewApplyCoupon : (object)[];
                    }

                    // Fetch the renewal packages and their respective coupons
                
                           
                    // Assign the ApplyCoupon information and renewal packages to the package
                    $Package->billing = $billing ?? (object)[];
                    $Package->coupon = $memberRenewPackageFirst == null ? $ApplyCoupon : (object)[];
                    $Package->renew_package = $memberRenewPackage ?? collect();
                }

                $manualPackage = Member::where('user_id', $user->id) 
                ->select(
                    'user_id',
                    'assigned_users_id',
                    'package_id',
                    'date_from',
                    'date_to',
                    'manual_price',
                    'membership_type' 
                )
                ->first();

                if($manualPackage)
                {
                    $assignMemberName = User::where('id',
                    $manualPackage->assigned_users_id)
                    ->select('users.name')
                    ->first();

                    $manualPackage['trainer'] = $assignMemberName->name;
                }
                 
                
                if($UserDetails)
                {
                    $role_has_permissions = DB::table('role_has_permissions')
                    ->where('role_id',$UserDetails->role)
                    ->join('permissions','permissions.id','role_has_permissions.permission_id')
                    ->select('role_has_permissions.permission_id', 'permissions.name')
                    ->get();    
                }
              
                $assignMember = DB::table('members_plans')
                ->where('assigned_users_id',$user->id) 
                ->get();
 
                $userIds = $assignMember->pluck('user_id')->toArray();

                $members = User::whereIn('id', $userIds)->select('users.id as user_id','users.name')->get();
 
                    $UserDetails->shift_name = DB::table('shifts')->where('id', $user->shift_id)->value('shift_name'); 
               
                
                

                 // Get client billing details
                $ClientBilling = DB::table('client_billings')
                ->where('user_id', $user->id)
                ->get();

                $totalRemainingDays = 0;

                foreach ($ClientBilling as $index => $clientBill) {
                // Fetch package name and assign to user details
                $packageName = DB::table('packages')
                    ->where('id', $clientBill->package_id)
                    ->value('package_name');
                $UserDetails->packageName = $packageName;

                // Assign starting and ending dates
                $UserDetails->starting_date = $clientBill->start_date;
                $UserDetails->end_date = $clientBill->end_date;

                // Calculate remaining days
                $remainingDays = Carbon::now()->diffInDays(Carbon::parse($clientBill->end_date), false);

                // If this is the first package, set initial remaining days
                if ($index === 0) {
                    // Allow negative remaining days if needed
                    $remainingDays = ($remainingDays < 0) ? $remainingDays : max(0, $remainingDays);
                } else {
                    // For subsequent packages, ensure remaining days are non-negative
                    $remainingDays = max(0, Carbon::parse($clientBill->start_date)->diffInDays(Carbon::parse($clientBill->end_date), false));
                    $totalRemainingDays += $remainingDays;
                }
                }

                // Final check for setting remaining days in user details
                if (isset($remainingDays) && $remainingDays < 0) {
                // Handle the case where dates are missing
                $UserDate = User::where('id', $user->id)->first();

                $UserDetails->remaining_days = ($UserDate->starting_date === null && $UserDate->end_date === null &&
                    $clientBill->end_date === null && $clientBill->start_date === null)
                    ? 0
                    : $remainingDays;
                    
                } else {
                $combinedRemainingDays = max(0, $totalRemainingDays + (isset($remainingDays) ? $remainingDays : 0));
                $UserDetails->remaining_days = $combinedRemainingDays;
                }
            

                $UserDetails->total_debit = $billing->paid_amount ?? 0;
                $UserDetails->total_credit = $billing->payable_amount ?? 0;
                // $UserDetails->remaining_balance = $UserDetails->total_credit - $UserDetails->total_debit ?? 0; 
                
                $getClientBillingdetails =DB::table('client_billings')->where('user_id',$user->id)->get();
                // return $user->id;
                $clientTotalDebit = 0;
                $clientTotalcredit= 0;
                $clientRemainigBalance =0;
                foreach($getClientBillingdetails as $getClientBillingdetail){
                    $clientTotalDebit += $getClientBillingdetail->amount;
                    $clientTotalcredit += $getClientBillingdetail->balance;
                    $clientRemainigBalance = $clientTotalcredit -$clientTotalDebit ;
                }
                $UserDetails->client_total_debit = $clientTotalDebit ?? 0;
                $UserDetails->client_total_credit = $clientTotalcredit ?? 0;
                $UserDetails->remaining_balance = $UserDetails->client_total_credit - $UserDetails->client_total_debit ?? 0; 
                // return $clientRemainigBalance;

            }
                // Extract the query string part for pagination URLs
                $firstPageUrl = parse_url($users->url(1), PHP_URL_QUERY) ? '/?' . parse_url($users->url(1), PHP_URL_QUERY) : null;
                $nextPageUrl = $users->nextPageUrl() ? '/?' . parse_url($users->nextPageUrl(), PHP_URL_QUERY) : null;
                $prevPageUrl = $users->previousPageUrl() ? '/?' . parse_url($users->previousPageUrl(), PHP_URL_QUERY) : null;
                
                // Prepare the pagination links in the specified format
                $formattedLinks = [];
                
                foreach ($users->linkCollection() as $link) {
                    // Extract the page number from the URL if it exists
                    $url = $link['url'] ? '/?' . parse_url($link['url'], PHP_URL_QUERY) : null;
                    $queryParams = [];
                    
                    if ($url) {
                        parse_str(parse_url($url, PHP_URL_QUERY), $queryParams);
                    }
                
                    // Cast the page number to an integer, or use null if it's not set
                    $pageNumber = isset($queryParams['page']) ? (int) $queryParams['page'] : null;
                
                    // Special handling for "Previous" and "Next" links
                    if ($link['label'] === '&laquo; Previous' || $link['label'] === 'Next &raquo;') {
                        $formattedLinks[] = [
                            'url' => $url === $prevPageUrl || $url === $nextPageUrl ? $url : null,
                            'label' => $link['label'],
                            'active' => $link['active'],
                            'page' => $link['active'] ? $pageNumber : $pageNumber,
                        ];
                    } 
                    else {
                        $formattedLinks[] = [
                            'url' => $url,
                            'label' => $link['label'],
                            'active' => $link['active'],
                            'page' => $pageNumber,
                        ];
                    }
                }
                
                // Prepare the pagination array
                $pagination = [
                    'first_page_url' => $firstPageUrl,
                    'from' => $users->firstItem(),
                    'to' => $users->lastItem(),
                    'items_per_page' => $limit,
                    'last_page' => $users->lastPage(),
                    'links' => $formattedLinks, // Use the formatted links
                    'next_page_url' => $nextPageUrl,
                    'page' => (int) $page, // Ensure the page number is sent as an integer
                    'prev_page_url' => $prevPageUrl,
                    'total' => $users->total(), // Get the total number of items
                ];
               
    
                 if (isset($Packages) && $UserDetails) {   
                    
                    $UserDetails['package'] = $Packages;
                    $UserDetails['member'] = isset($members);
                    // $UserDetails['custom_package'] =  $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
                    // $Package['coupon'] = $ApplyCoupon ?? (object)[];
                    $UserDetails['permission'] = isset($role_has_permissions) ?? null; 
                } 
                // else {
                    
                //     $UserDetails['package'] = (object)[];
                //     // $UserDetails['custom_package'] = isset($UserDetails) || $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
                //     $UserDetails['member'] = isset($members);
                //     // $Package['coupon'] = $ApplyCoupon ?? (object)[];
                //     $UserDetails['permission'] = isset($role_has_permissions); 
                // }
                 
    
                if($request->search == null)
                {
                    $userData[] =$UserDetails;
                    
                }
                else
                {
                   
                    $userData =$clientSearch;
                }
            }
    
            if (!$users->isEmpty()) {
                return Response::json([
                    'status' => 1,
                    'message' => 'Get User Successfully',
                    'links' => [
                        'csv_download_link' => $csvDownloadLink,
                        'excel_download_link' => $excelDownloadLink,
                    ],
                    'data' =>  $userData,
                    'payload' => [
                        'pagination' => $pagination
                    ],
                ]);
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No User Available'
                ], 400);
            }
        }
    }
    
    public function DeleteMember($ids)
    {
        //return $ids;
        // Convert the comma-separated string of IDs into an array
        $userIds = explode(',', $ids);
    
        // Validate the IDs to ensure they are all integers and exist in the database
        $validatedIds = User::whereIn('id', $userIds)->pluck('id')->toArray();
    
        if (empty($validatedIds)) {
            return response()->json([
                'status' => 0,
                'message' => 'No valid user IDs provided',
            ], 404);
        }
    
        // Start a transaction to ensure all deletions happen together
        DB::transaction(function () use ($validatedIds) {
            // Delete users, addresses, and apply_coupon records
            DB::table('users')->whereIn('id', $validatedIds)->update([
                'deleted_at' => Carbon::now()->format('Y-m-d H:i:s'), 
                'deleted_by' => Auth::user()->id ?? 1
            ]);
            DB::table('addresses')->whereIn('user_id', $validatedIds)->update([
                    'deleted_at' => Carbon::now()->format('Y-m-d H:i:s'), 
                    'deleted_by' => Auth::user()->id ?? 1
                ]);
            DB::table('apply_coupons')->whereIn('user_id', $validatedIds)->update([
                'deleted_at' => Carbon::now()->format('Y-m-d H:i:s'), 
                'deleted_by' => Auth::user()->id ?? 1
            ]);
            // Uncomment if you need to delete member records as well
            // DB::table('members')->whereIn('user_id', $validatedIds)->delete();
        });
    
        return response()->json([
            'status' => 1,
            'message' => 'Users deleted successfully',
        ], 200);
    }



public function EditMember(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|'
        ]); 
         
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'User does not exist'
            ], 422);
        } 

        $UserDetails = User::where('users.id', $request->user_id) 
        ->join('centers', 'centers.id', 'users.center_id')
        ->join('roles', 'roles.id', 'users.role')
        ->join('addresses as a', 'a.user_id', 'users.id')
        ->select(
            'users.*', 
            'a.city_id as city_name',
            'a.state_id as state_name',
            'centers.id as center_id',
            'centers.name as center_name',
            'address_line_1',
            'address_line_2',
            'a.pincode',
            'centers.city_id as center_city_name',
            'centers.state_id as center_state_name',
            'roles.name as role_name'
        )
        ->first();

    if ($UserDetails) {
        // Fetch city and state names
        // $UserDetails->city_id = City::where('id', $UserDetails->city_id)->value('name');
        // $UserDetails->state_id = State::where('id', $UserDetails->state_id)->value('name');

         // Fetch member details
         $Packages = MembersPlans::where('user_id', $request->user_id)
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

         // Fetch the renewal packages and their respective coupons
         $memberRenewPackageFirst = RenewPackage::where('user_id', $request->user_id)
             ->where('package_id', $Package->package_id)
             ->whereNotNull('coupon_id')  
             ->first(); 
     
         // Fetch the ApplyCoupon information based on the package_id of the current package
         $ApplyCoupon = ApplyCoupon::where('user_id', $request->user_id)
             ->where('package_id', $Package->package_id)
             ->select( 
                 'apply_coupons.id as apply_coupon_id',
                 'package_id',
                 'discount_price',
                 'final_price',
                 'coupon_id',
                 'applied_at'
             )
             ->first();
     
         // Fetch the renewal packages and their respective coupons
         $memberRenewPackage = RenewPackage::where('user_id', $request->user_id)
             ->where('package_id', $Package->package_id)
            //  ->whereNotNull('coupon_id')
             ->select(
                 'user_id',
                 'package_id',
                 'renew_start_date',
                 'renew_end_date',
                 'renew_no_of_days',
                 'coupon_id'
             )
             ->orderBy('id', 'desc')
             ->get();
     
         // Add renewal package and associated coupon information to each renewal package
         foreach ($memberRenewPackage as $renewPackage) {
             $renewApplyCoupon = ApplyCoupon::where('user_id', $renewPackage->user_id)
                 ->where('package_id', $renewPackage->package_id) 
                 ->select(
                     'apply_coupons.id as apply_coupon_id',
                     'package_id',
                     'discount_price',
                     'final_price',
                     'coupon_id',
                     'applied_at'
                 )
                 ->first();
                
             $renewPackage->coupon = $renewPackage->coupon_id != null ?  $renewApplyCoupon : (object)[];
         }
     
         // Assign the ApplyCoupon information and renewal packages to the package
         $Package->coupon = $memberRenewPackageFirst == null ? $ApplyCoupon : (object)[];
         $Package->renew_package = $memberRenewPackage ?? collect();
     }

            // dd($Packages);
            $manualPackage = Member::where('user_id', $request->user_id) 
            ->select(
                'user_id',
                'assigned_users_id',
                'package_id',
                'date_from',
                'date_to',
                'manual_price',
                'membership_type' 
            )
            ->first();

            if($manualPackage)
            {
                $assignMemberName = User::where('id',$manualPackage->assigned_users_id)
                ->select('users.name')
                ->first();
                
                $manualPackage['trainer'] = $assignMemberName->name;
               
            }
     
           
        

        $role_has_permissions = DB::table('role_has_permissions')
        ->where('role_id',$UserDetails->role)
        ->join('permissions','permissions.id','role_has_permissions.permission_id')
        ->select('role_has_permissions.permission_id', 'permissions.name')
        ->get();

        $assignMember = DB::table('members_plans')
        ->where('assigned_users_id',$request->user_id) 
        ->get();

        
        

        $userIds = $assignMember->pluck('user_id')->toArray();
        
        $members = User::whereIn('id', $userIds)->select('users.id as user_id','users.name')->get();

        
         
        if ($Package) {  
            
            $UserDetails['package'] = $Packages;
            $UserDetails['member'] = $members;
            // $UserDetails['custom_package'] =  $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
            // $Package['coupon'] = $ApplyCoupon ?? (object)[];
            $UserDetails['permission'] = $role_has_permissions; 
        } else { 
            $UserDetails['package'] = (object)[];
            // $UserDetails['custom_package'] = $Packages == null && $UserDetails->role == 20 ? $manualPackage : (object)[]; 
            $UserDetails['member'] = $members;
            // $Package['coupon'] = $ApplyCoupon ?? (object)[];
            $UserDetails['permission'] = $role_has_permissions; 
        }

        $userData[] = $UserDetails;

    }
       
        if($UserDetails)
        {
            return response()->json([
                'status' => 1,
                'message' => 'User Get Successfully', 
                'data' => $userData
            ]);
        }
        else
        {
            return response()->json([
                'status' => 0,
                'message' => 'User id does not exist', 
            ]);
        }
        
    }
    
       public function UpdateMember(Request $request, $member_id)
    {
         
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'surname' => 'required',
            'password' => 'nullable|string|min:8',
            // 'role' => 'required',
            'mobile' => 'required|string|max:15',
            'gym_member_code' => 'nullable|string|max:100',
            'gender' => 'required',
            'image' => 'nullable|max:255',
            'occupation_id' => 'nullable|integer',
            'marital_status' => 'nullable|in:single,married',
            // 'dob' => 'nullable|date|before_or_equal:' . date('Y-m-d', strtotime('-18 years')),
            'visit_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
           // 'joining_date' => 'nullable|date|after_or_equal:' . date('Y-m-d'),
            'anniversary_date' => 'nullable|date',
            'tentative_joining_date' => 'nullable|date',
            'description' => 'nullable|string',
            'remark' => 'nullable|in:1,2',
            'inquiry_mode' => 'nullable|in:1,2,3',
            'source_id' => 'nullable|integer',
            'employee_id_proof' => 'nullable|string|max:255',
            // 'status' => 'required|in:1,2',
            // 'address' => 'required|string',
            // 'city_id' => 'required',
            // 'state_id' => 'required',
            // 'pincode' => 'required',
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

        $user = DB::table('users')->where('id', $member_id)
        // ->where('role', 20)
        ->first();

        if (!$user) {
            return response()->json([
                'status' => 0,
                'message' => 'User ID does not exist',
            ], 404);
        }

        $imagePath = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = $image->storeAs('images', $imageName, 'public');
        }

        DB::transaction(function () use ($request, $user, $imagePath) { // Passing $user here
            
            User::where('id', $user->id)->update([
                'name' => $request->input('name'),
                'surname' => $request->input('surname'),
                'email' => $request->input('email'),
                'center_id' => $request->input('center_id') ?? 1,
                'mobile_number' => $request->input('mobile'),
                'gym_member_code' => $request->input('gym_member_code'),
                'gender' => $request->input('gender'),
                'image' => $imagePath ?? null,
                'occupation_id' => $request->input('occupation_id'),
                'marital_status' => $request->input('marital_status'),
                // 'date_of_birth' => $request->input('dob'),
                'visit_date' => $request->input('visit_date'),
                //'joining_date' => $request->input('joining_date'),
                'tentative_joining_date' => $request->input('tentative_joining_date'),
                'anniversary_date' => $request->input('anniversary_date'),
                'description' => $request->input('description'),
                'remark' => $request->input('remark'),
                'inquiry_mode' => $request->input('inquiry_mode'),
                'source_id' => $request->input('source_id'),
                'employee_id_proof' => $request->input('employee_id_proof'),
                'status' => $request->input('status'),
                'surname' => $request->surname,
                'updated_by' => \Auth::user()->id ?? 1,
                'shift_id' => $request->shift_id ?? 1
                // 'starting_date' => $request->input('starting_date'),
                // 'end_date' => $request->input('end_date'),
            ]);

            // if ($user->role == 20) {

            //     if($request->apply_coupon_id)
            //     {
                          
            //         $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
 
            //         $package = Package::where('id',$request->package_id)->first(); 

            //         $discountAmount = $package != null ? ($package->price * $coupon->percentage) / 100 : null; 
                        
            //         $finalPrice = $package != null ? $package->price - $discountAmount : null;  

            //         $payble_amount = $finalPrice; 

            //         $billing = Billing::where('user_id',$user->id)->update([
            //             'user_id' => $user->id,
            //             'package_id' => $request->package_id,
            //             'discount_price' => $discountAmount,
            //             'final_price' => $finalPrice,
            //             'paid_amount' => $request->paid_amount ?? 0,
            //             'payable_amount' => $request->payable_amount ?? $payble_amount, 
            //         ]); 

            //         $ApplyCoupon = ApplyCoupon::where('user_id',$user->id)->update([
            //             'user_id' => $user->id,
            //             'package_id' => $request->package_id,
            //             'discount_price' => $discountAmount,
            //             'final_price' => $finalPrice,
            //             'paid_amount' => $request->paid_amount,
            //             'coupon_id' => $request->apply_coupon_id,
            //             'billing_id' => $billing->id,
            //             'applied_at' => Carbon::now(), 
            //         ]);
            //     } 
            //     else
            //     { 
                  
            //         $billing = Billing::where('user_id',$user->id)->update([
            //             'user_id' => $user->id,
            //             'package_id' => $request->package_id ?? null,
            //             'discount_price' => 0,
            //             'final_price' => 0,
            //             'paid_amount' => $request->paid_amount ?? 0,
            //             'payable_amount' => $request->payable_amount ?? 0, 
            //         ]);  
            //     } 

            //     $memberPackage = Package::where('id', $request->package_id)->first();
            
            //     if ($request->date_from && $request->date_to) {
            //         $dateFrom = Carbon::parse($request->date_from);
            //         $dateTo = Carbon::parse($request->date_to);
            //         $noOfDays = $dateFrom->diffInDays($dateTo);
            //     }

            //     $membersPlan = new MembersPlans();
            //     $membersPlan->user_id = $user->id;
            //     $membersPlan->package_id = $request->package_id ?? 0;
            //     $membersPlan->package_name = $memberPackage->package_name ?? 'Manual Package';
            //     $membersPlan->price = $memberPackage->price ?? $request->manual_price;
            //     $membersPlan->center_id = $request->center_id ?? 1;
            //     $membersPlan->no_of_days = $memberPackage->no_of_days ?? $noOfDays;
            //     $membersPlan->product_type = $memberPackage->product_type ?? $request->product_type;
            //     $membersPlan->training_type = $memberPackage->training_type ?? $request->training_type;
            //     $membersPlan->package_timing = $memberPackage->package_timing ?? $request->package_timing;
            //     $membersPlan->package_type = $memberPackage->package_type ?? $request->package_type;
            //     $membersPlan->show_at_advicefit_platform = $memberPackage->show_at_advicefit_platform ?? $request->show_at_advicefit_platform;
            //     $membersPlan->status = $memberPackage->status ?? $request->packge_status;
            //     $membersPlan->date_from = $request->date_from ?? $memberPackage->date_from;
            //     $membersPlan->date_to = $request->date_to ?? $memberPackage->date_to;
            //     $membersPlan->manual_price = $request->manual_price ?? $memberPackage->manual_price;
            //     $membersPlan->membership_type = $memberPackage->membership_type ?? 0;
            //     $membersPlan->assigned_users_id = $request->trainer_id ?? 2;

            //     MembersPlans::where('user_id', $user->id)->update($membersPlan->toArray());
            // // }

            Address::where('user_id', $user->id)->update([
                'address_first' => $request->address,
                'address_second' => $request->address_second ?? null,
                'city_id' => $request->city_id,
                'state_id' => $request->state_id,
                'pincode' => $request->pincode,
                'user_id' => $user->id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ]);

        });

        return response()->json([
            'status' => 1,
            'message' => 'Client Profile Updated Successfully',
        ], 200);
    }
      
    
    public function addUser(Request $request, $user_id = null)
    {
        
          // Adjust validation rules based on whether it's an update or a new user
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'surname' => 'required',
            //'password' => $user_id ? 'nullable|string|min:8' : 'required|string|min:8',
            'role' => 'required',
            'center_id' => 'required|integer',
            'mobile' => 'required|string|max:15', 
            'gender' => 'required',
            'image' => 'nullable|max:255',
            //'joining_date' => $user_id ? 'nullable|date' : 'required|date|after_or_equal:' . date('Y-m-d'),
            // 'description' => 'nullable|string',
            // 'status' => 'required|in:1,2',
            // 'address' => 'nullable|string',
            // 'dob' => $user_id ? 'nullable' : 'required|date'
        ]);
      

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        
       

        $userExist = User::where('id',$request->id)->first();
        $imagePath = null;
        // if ($request->hasFile('image')) {
        //     $image = $request->file('image');
        //     $imageName = time().'.'.$image->getClientOriginalExtension();
        //     $imagePath = $image->storeAs('images', $imageName, 'public');
        // } 
        
        if ($request->hasFile('image')) {
            
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('images');  // Path to the public/images directory
        
            // Ensure the directory exists, if not create it
            if (!file_exists($imagePath)) {
                mkdir($imagePath, 0777, true);
            }
        
            // Move the uploaded file to the public/images directory
            $image->move($imagePath, $imageName);
        
            // Store the relative path to the image in the database
            $imagePath = 'images/' . $imageName;
        }
      if (!isset($request->password)) {
            // return 'ppp';
            $user = User::updateOrCreate(
                ['id' => $request->id],
                [
                    'name' => $request->input('name'),
                    'surname' => $request->input('surname'),
                    'email' => $request->input('email') ?? null,
                    'role' => $request->input('role'),
                    'center_id' => $request->input('center_id'),
                    'mobile_number' => $request->input('mobile'),
                    'gym_member_code' => $request->input('gym_member_code'),
                    'gender' => $request->input('gender'),
                    'image' => $imagePath ?? $userExist->image ?? null,
                    'joining_date' => $request->input('joining_date'),
                    'description' => $request->input('description'),
                    'date_of_birth' => $request->input('dob'),
                    'status' => $request->input('status'),
                ]
            );
        } else {
            // return 'ooo';
            $user = User::updateOrCreate(
                ['id' => $request->id],
                [
                    'name' => $request->input('name'),
                    'surname' => $request->input('surname'),
                    'email' => $request->input('email') ?? null,
                    'password' => Hash::make($request->input('password')) ?? Hash::make('password'),
                    'role' => $request->input('role'),
                    'center_id' => $request->input('center_id'),
                    'mobile_number' => $request->input('mobile'),
                    'gym_member_code' => $request->input('gym_member_code'),
                    'gender' => $request->input('gender'),
                    'image' => $imagePath ?? $userExist->image ?? null,
                    'joining_date' => $request->input('joining_date'),
                    'description' => $request->input('description'),
                    'date_of_birth' => $request->input('dob'),
                    'status' => $request->input('status'),
                ]
            );
        }
       
        // $user = User::updateOrCreate(
        //     ['id' => $request->id],
        //     [
        //         'name' => $request->input('name'),
        //         'surname' => $request->input('surname'),
        //         'email' => $request->input('email') ?? null,
        //         'password' => Hash::make($request->input('password')) ?? Hash::make('password'),
        //         'role' => $request->input('role'),
        //         'center_id' => $request->input('center_id'),
        //         'mobile_number' => $request->input('mobile'),
        //         'gym_member_code' => $request->input('gym_member_code'),
        //         'gender' => $request->input('gender'),
        //         'image' => $imagePath ?? $userExist->image ?? null,
        //         'joining_date' => $request->input('joining_date'),
        //         'description' => $request->input('description'),
        //         'date_of_birth' => $request->input('dob'),
        //         'status' => $request->input('status'),
        //     ]
        // );

        if ($user) {
            if ($request->has('address')) {
                Address::updateOrCreate(
                    ['user_id' => $user->id],
                    [
                        'address_first' => $request->input('address'),
                        'city_id' => $request->input('city_id') ?? null,
                        'state_id' => $request->input('state_id') ?? null,
                        'pincode' => $request->input('pincode') ?? null,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now(),
                    ]
                );
            }

            return response()->json([
                'status' => 1,
                'message' => $user_id ? 'User updated successfully' : 'User added successfully',
                'data' => $user,
            ], 200);
        }

        return response()->json([
            'status' => 0,
            'message' => 'Failed to add/update user',
        ], 500);
    }
    
     public function getUsersList(Request $request,$user_id = null)
    {
        $base_url =  config('app.url');
        if($user_id)
        {
            $getUsers =  User::where('users.id',$user_id)
            ->join('addresses as a', 'a.user_id', 'users.id')
             ->select(
                    'users.*', 
                    'a.address_first',
                    'a.city_id',
                    'a.state_id',
                    'a.pincode'
                )
                ->first();
                 
             
            $centerName = \DB::table('centers')->where('id',$getUsers->center_id)->first(); 

            $RoleName = \DB::table('roles')->where('id',$getUsers->role)->value('name');
            $getUsers->role_name = $RoleName; 
            
            $getUsers->center_name = $centerName->name;
             $getUsers->image = $getUsers->image != null ? $base_url.'/public/'.$getUsers->image : null;
            
            //  $role = Role::find($getUsers->role); 
            // if ($role) { 
            //    $getUsers->role_name =  $role->name;
            // }  
              // Load roles and permissions
            $getUsers->load('roles.permissions');

            
             return Response::json([
                    'status' => 1,
                    'message' => 'Get User Details Successfully',
                    'data' => $getUsers
                ]);
        }
        $UserDetails =  User::
                    // where('role','!=',20)
                // ->where('role','!=',15) 
                join('addresses as a', 'a.user_id', 'users.id')
                ->whereNotNull('role')
             ->select(
                    'users.*', 
                    'a.address_first',
                    'a.city_id',
                    'a.state_id',
                    'a.pincode'
                )
                  ->get();
                  
                  
                   $search = $request->search; 
                   $searchTerms = explode(' ', $search);
                // $UserSearch = User::whereNotNull('role')
                // ->where(function($query) use ($search) {
                //     $query->where('name', 'LIKE', "%$search%")
                //           ->orWhere('mobile_number', 'LIKE', "%$search%");
                // })
                // ->get();
                $UserSearch = User::whereNotNull('role')
                    ->where(function ($query) use ($searchTerms) {
                        foreach ($searchTerms as $term) {
                            $query->where(function ($subQuery) use ($term) {
                                $subQuery->where('name', 'LIKE', "%$term%")
                                         ->orWhere('surname', 'LIKE', "%$term%")
                                         ->orWhere('mobile_number', 'LIKE', "%$term%");
                            });
                        }
                    })
    ->get();

 
                if($UserSearch->isEmpty())
                {
                    return response()->json([
                        'status' => 0,
                        'message' => 'No Data Found', 
                    ],200);
                } 
                
                foreach ($UserSearch as $getUsers) {
                    $centerName = \DB::table('centers')->where('id',$getUsers->center_id)->first(); 
    
                    $RoleName = \DB::table('roles')->where('id',$getUsers->role)->value('name');
                    $getUsers->role_name = $RoleName; 
                    $getUsers->center_name = $centerName->name ?? null;
    
    
                    
                     $role = Role::find($getUsers->role); 
                    // if ($role) { 
                    //   $getUsers->role_name =  $role->name;
                    // } 
                    
                     $getUsers->image = $getUsers->image != null ? $base_url.'/public/'.$getUsers->image : null;
    
                    $getUsers->load('roles.permissions'); 
                }
                 
            foreach ($UserDetails as $getUsers) {
                $centerName = \DB::table('centers')->where('id',$getUsers->center_id)->first(); 

                $RoleName = \DB::table('roles')->where('id',$getUsers->role)->value('name');
                $getUsers->role_name = $RoleName; 
                $getUsers->center_name = $centerName->name ?? null;


                
                 $role = Role::find($getUsers->role); 
                // if ($role) { 
                //   $getUsers->role_name =  $role->name;
                // } 
                
                 $getUsers->image = $getUsers->image != null ? $base_url.'/public/'.$getUsers->image : null;

                $getUsers->load('roles.permissions');
               
            }
            
             return Response::json([
                    'status' => 1,
                    'message' => 'Get User Details Successfully',
                    'data' =>  $request->search == null ? $UserDetails : $UserSearch,
                    //'data' => $UserDetails
                ]);
    }
    
     public function deleteUser($user_ids)
    {
        // Convert the comma-separated string of IDs into an array
        $userIds = explode(',', $user_ids);
    
        // Validate the IDs to ensure they exist in the users table
        $validUserIds = User::whereIn('id', $userIds)->pluck('id')->toArray();
    
        if (empty($validUserIds)) {
            return response()->json([
                'status' => 0,
                'message' => 'No valid user IDs provided',
            ], 404);
        }
    
        // Start a transaction to ensure all deletions happen together
        DB::transaction(function () use ($validUserIds) {
            // Delete users and their addresses where the user ID matches
            User::whereIn('id', $validUserIds)->delete();
            Address::whereIn('user_id', $validUserIds)->delete();
        });
    
        return response()->json([
            'status' => 1,
            'message' => 'Users and their addresses deleted successfully',
        ], 200);
    }
    
    public function getShifts()
    {
        $shift = DB::table('shifts')->get();
        if($shift)
        {
            return response()->json([
                'status' => 1,
                'message' => 'Shifts List Get Successfully',
                 'data' => $shift
             ], 200);
        }
       
    }
    
    public function MemberBilling(Request $request)
    {
        // Custom validation logic

        $validator = Validator::make($request->all(), [
            'package_id' => 'required', 
            'user_id' => 'required',
        ]); 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        } 

        if($request->apply_coupon_id)
        {
                    
            $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();

            $package = Package::where('id',$request->package_id)->first(); 

            $discountAmount = ($package->price * $coupon->percentage) / 100; 
                
            $finalPrice = $package->price - $discountAmount;  

            $payble_amount = $finalPrice; 

            $billing = Billing::create([
                'user_id' => $request->user_id,
                'package_id' => $request->package_id,
                'discount_price' => $discountAmount,
                'final_price' => $finalPrice,
                'paid_amount' => $request->paid_amount ?? 0,
                'remark' => $request->remark,
                'payable_amount' => $request->payable_amount ?? $payble_amount, 
            ]); 

            $ApplyCoupon = ApplyCoupon::create([
                'user_id' => $request->user_id,
                'package_id' => $request->package_id,
                'discount_price' => $discountAmount,
                'final_price' => $finalPrice,
                'paid_amount' => $request->paid_amount,
                'coupon_id' => $request->apply_coupon_id,
                'billing_id' => $billing->id,
                'applied_at' => Carbon::now(), 
            ]);
        } 
        else
        { 
            
            $billing = Billing::create([
                'user_id' => $request->user_id,
                'package_id' => $request->package_id,
                'discount_price' => 0,
                'final_price' => 0,
                'paid_amount' => $request->paid_amount ?? 0,
                'remark' => $request->remark,
                'payable_amount' => $request->payable_amount ?? 0, 
            ]);  
 
        }  

        return response()->json([
            'status' => 1,
            'message' => 'Bill Created Successfully', 
            'data' => $request->apply_coupon_id != null ? $ApplyCoupon : $billing
        ],200); 
    }

    public function GetMemberBillingDetaile(Request $request, $member_id)
    {
        $BillingDetails = Billing::where('user_id', $member_id)->first();

        if (!$BillingDetails) {
            return response()->json([
                'status' => 0,
                'message' => 'User does not exist',
            ], 404);
        }

        $billings = Billing::where('user_id', $member_id)
            ->select(
                'billings.id as billing_id',
                'package_id',
                'discount_price',
                'final_price',
                'paid_amount',
                'payable_amount',
                'remark'
            )
            ->get();

        $total_debit = 0;
        $total_credit = 0;

        foreach ($billings as $billing) {
            // Fetch the package details
            $Package = Package::where('id', $billing->package_id)->first();

            // Set the total amount based on the package price
            $billing->total_amount = $Package->price ?? 0;

            // Initialize the remaining price with package price - paid amount
            $billing->remaining_price = $billing->total_amount - $billing->paid_amount;
            $billing->package_name = $Package != null ? $Package->package_name : null;

            // Accumulate the total debit and credit amounts
            $total_debit += $billing->paid_amount;
            $total_credit += $billing->total_amount;

            // Fetch the applied coupon, if any, for the current billing entry
            $ApplyCoupon = ApplyCoupon::where('user_id', $member_id)
                ->where('package_id', $billing->package_id)
                ->where('apply_coupons.billing_id', $billing->billing_id) // Assuming you have a `billing_id` to link coupons to specific billing entries
                ->join('coupons', 'coupons.id', '=', 'apply_coupons.coupon_id')
                ->select(
                    'apply_coupons.id as apply_coupon_id',
                    'package_id',
                    'discount_price',
                    'final_price',
                    'coupon_id',
                    'paid_amount',
                    'coupons.coupon_name',
                    'applied_at'
                )
                ->first();

            if ($ApplyCoupon) {
                // Adjust the remaining price based on the coupon's final price and paid amount
                $billing->remaining_price = $ApplyCoupon->final_price - $ApplyCoupon->paid_amount;
                $ApplyCoupon->total_amount = $Package->price ?? 0;
                $ApplyCoupon->remaining_price = $billing->remaining_price;
            }

            $billing->coupon = $ApplyCoupon ?? (object)[];
        }

        return response()->json([
            'status' => 1,
            'message' => 'Billing Details Get Successful',
            'total_debit' => $total_debit,
            'total_credit' => $total_credit,
            'data' => $billings,
        ], 200);
    }
    
     public function DeleteBilling($billing_id)
    {
        $billing = Billing::where('id', $billing_id)->first();
        $applyCoupon = ApplyCoupon::where('billing_id', $billing_id)->first();

        if(!$billing && !$applyCoupon)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Billing id not found',  
            ],404);
        }
        else
        { 
            $billing->delete();
            $applyCoupon->delete();

            return response()->json([
                'status' => 1,
                'message' => 'Billing deleted successfully',  
            ],200);

        }
    }

     public function GetClientID(Request $request)
    {
        $GetLastClintID = User::where('client_id','!=',0)->orderBy('client_id','desc')->select('client_id')->first();

        if($GetLastClintID != null)
        {
            return response()->json([
                'status' => 1,
                'message' => 'Last client ID get successfully', 
                'data' => $GetLastClintID
            ],200);
        }
        else
        {
            return response()->json([
                'status' => 1,
                'message' => 'Last client ID get successfully', 
                'data' => [
                    'client_id' => 1000
                ]
            ],200);   
        }
    }
    
    // public function Dashboard(Request $request)
    // {

    //     $date = date('Y-m-d'); 

    //     $member = DB::table('users')
    //     ->where('role', '!=', 15)
    //     ->orWhereNull('role') 
    //     ->count();

    //     $newLead = DB::table('users')
    //     // ->where('role', '!=', 15)
    //     ->orWhereNull('end_date') 
    //     ->where('created_at', Carbon::today())
    //     ->count();

    //     $balance = DB::table('client_billings')->sum('balance');
    //     $amount = DB::table('client_billings')->sum('amount');
 
    //     $balanceDue = $balance - $amount; 

    //     $memberExpired = DB::table('users') 
    //     // ->where('role', '!=', 15)
    //     ->whereDate('end_date', '<=' ,$date) 
    //     ->count(); 

    //     $totalExpeness = DB::table('expenses')->sum('amount');

    //     return response()->json([
    //         'status' => 1,
    //         'message' => 'Dashboard Details Get Successfully', 
    //         'data' => [
    //             'members' => $member,
    //             'newlead' => $newLead,
    //             'balance_due' => $balanceDue,
    //             'member_expired' => $memberExpired,
    //             'expeness' => $totalExpeness,
    //             'collected' => $amount,
    //             'sale' => $balance,
    //             'renew_subscription' => 0

    //         ]
    //     ],200);  
    // }
    
    
     public function Dashboard(Request $request)
    {
        // Get the filter type from the request and default to 'daily'
        $type = $request->input('type', 'daily');
    
        // Check if custom date range is provided
        $startDate = $request->input('start_date') ? Carbon::parse($request->input('start_date')) : null;
        $endDate = $request->input('end_date') ? Carbon::parse($request->input('end_date')) : null;
    
        // If custom dates are not provided, apply default date range based on type
        if (!$startDate || !$endDate) {
            if ($type === 'monthly') {
                $startDate = Carbon::now()->startOfMonth();
                $endDate = Carbon::now()->endOfMonth();
            } elseif ($type === 'yearly') {
                $startDate = Carbon::now()->startOfYear();
                $endDate = Carbon::now()->endOfYear();
            } elseif ($type === 'weekly') {
                $startDate = Carbon::now()->startOfWeek();
                $endDate = Carbon::now()->endOfWeek();
            } else {
                // Default to daily filter
                $startDate = Carbon::today();
                $endDate = Carbon::today()->endOfDay();
            }
        }
    
        // Fetch general dashboard data
        $member = DB::table('users')
        ->whereNull('role')
        ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
        ->whereNull('deleted_at') // Apply the DATE function
        // ->where(function ($query) {
        //     $query->where('role', '!=', 15)
        //           ->orWhereNull('role'); // Check role condition
        // })
        ->count();
        
    
        // $newLead = DB::table('users')
        //     ->whereNull('end_date')
        //     ->whereNull('deleted_at')
        //     ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
        //     ->count();
    
        $balance = DB::table('client_billings')
            // ->whereNull('deleted_at')
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->sum('balance');
        $amount = DB::table('client_billings')
            // ->whereNull('deleted_at')
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->sum('amount');
        $balanceDue = $balance - $amount;

        $newLead = DB::table('subscriptions')
             // ->where('created_by', $user->id)
             ->whereNull('deleted_at')
              ->where('type', 1)
           ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
           ->count();
    
        // $memberExpired = DB::table('users')
        //     ->whereDate('end_date', '<=', $endDate)
        //     ->whereNull('deleted_at')
        //     ->count();
            
            
        // $memberExpired = DB::table('client_billings')
        //     ->whereDate('end_date', '<=', $endDate)
        //     //->whereNull('deleted_at')
        //     ->count();
        $memberExpired = DB::table('client_billings')
            ->whereBetween(DB::raw('DATE(end_date)'),  [$startDate, $endDate])
            //->whereNull('deleted_at')
            ->count();
    
        
        $totalExpeness = DB::table('expenses')
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->whereNull('deleted_at')
            ->sum('amount');
    
        // Fetch grouped data by `created_by`
        $users = DB::table('users as u')
        ->whereNotNull('role')
        ->whereNull('deleted_at') 
        ->get(); 
    
    // Prepare the users array manually
    $usersData = [];
    
    foreach ($users as $user) {
        // Fetch balance and amount for each user from client_billings
        $balance = DB::table('client_billings')
            ->where('created_by', $user->created_by)
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->sum('balance');
    
        $amount = DB::table('client_billings')
            ->where('created_by', $user->created_by)
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->sum('amount'); 
    
        $balanceDue = $balance - $amount; 


        $CreateMem = DB::table('users')
        ->where('created_by',$user->id)
        ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
        ->whereNull('deleted_at')
        ->count();

        $ExpireMem = DB::table('users')
        ->where('created_by',$user->id)
        ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
        ->whereNull('deleted_at')
        ->whereDate('end_date', '<=', $endDate)
        ->count();

        $DaiySpa = DB::table('subscriptions') 
            ->whereNull('deleted_at')
            ->where('type', 2)
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->count();

            $DaiySpaCustomer = DB::table('subscriptions')
            ->where('created_by', $user->id)
            ->whereNull('deleted_at')
            ->where('type', 2)
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->count();

        $DaiyCustomer = DB::table('subscriptions')
            ->where('created_by', $user->id)
            ->whereNull('deleted_at')
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->where('type', 1)
            ->count();
      
      
        // Fetch the role name for each user
        $roleName = DB::table('roles')
            ->where('id', $user->role)
            ->value('name');
            
        $totalExpeness = DB::table('expenses')
        ->where('created_by', $user->id)
        ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
        ->whereNull('deleted_at')
        ->sum('amount');
    
        // Add user data to the users array
        $usersData[] = [ 
            'name' => $user->name . ' ' . $user->surname,
            'role_name' => $roleName,
            'members_created' => $CreateMem,
           // 'expireMember' => $ExpireMem,
            'expireMember' => $totalExpeness,
            'daily_spa_customer' => $DaiySpaCustomer,
            'daily_customer' => $DaiyCustomer

        ];
    }
    
    
        // Return the dashboard data
        return response()->json([
            'status' => 1,
            'message' => 'Dashboard Details Retrieved Successfully',
            'data' => [
                'members' => $member,
                'newlead' => $newLead,
                'balance_due' => $balanceDue,
                'daily_spa' => $DaiySpa,
                'member_expired' => $memberExpired,
                'expeness' => $totalExpeness,
                'collected' => $amount,
                'sale' => $balance,
                'renew_subscription' => 0, // Update logic as needed
                'users' => $usersData // Add the users array with grouped data
            ]
        ], 200);
    }
    
    public function DashboardGraph(Request $request)
    {
        // Get the filter type from the request and default to 'daily'
        $type = $request->input('type', 'daily');
    
        // Create an associative array to handle the different date ranges
        $dateRanges = [
            'daily' => [
                'start' => Carbon::today(),
                'end' => Carbon::today()->endOfDay(),
                'format' => 'H', // Hourly for daily
                'interval' => '1 hour'
            ],
            'weekly' => [
                'start' => Carbon::now()->startOfWeek(),
                'end' => Carbon::now()->endOfWeek(),
                'format' => 'D', // Day of the week
                'interval' => '1 day'
            ],
            'monthly' => [
                'start' => Carbon::now()->startOfMonth(),
                'end' => Carbon::now()->endOfMonth(),
                'format' => 'd', // Day of the month
                'interval' => '1 day'
            ],
            'yearly' => [
                'start' => Carbon::now()->startOfYear(),
                'end' => Carbon::now()->endOfYear(),
                'format' => 'm', // Month
                'interval' => '1 month'
            ]
        ];
        
    
        // Use the selected date range based on the type (default to daily if not found)
        $selectedRange = $dateRanges[$type] ?? $dateRanges['daily'];
    
        $startDate = $selectedRange['start'];
        $endDate = $selectedRange['end'];
        $dateFormat = $selectedRange['format'];
        $interval = $selectedRange['interval'];
    
        // Prepare a collection to store the data for the graph
        $dateRange = CarbonPeriod::create($startDate, $interval, $endDate);
    
        $graphData = [];
    
        foreach ($dateRange as $date) {
            // For monthly and yearly, show month and day or just month as needed
            if ($type === 'monthly') {
                // Include both month and day
                $formattedDate = $date->format('M d'); // E.g., 'Jan 01'
            } elseif ($type === 'yearly') {
                // Include only the month
                $formattedDate = $date->format('M'); // E.g., 'Jan'
            } else {
                // Keep existing formatting for daily or weekly
                $formattedDate = $date->format($dateFormat);
            }
        
            // Fetch the count of members (excluding role 15) created within the specific date range
            $membersCount = DB::table('users')
                ->whereDate('created_at', $date->format('Y-m-d'))
                ->where(function($query) {
                    $query->where('role', '!=', 15)
                          ->orWhereNull('role');
                })
                ->count();
        
            // Fetch the count of new leads created within the specific date range
            $newLeadCount = DB::table('users')
                ->whereNull('end_date')
                ->whereDate('created_at', $date->format('Y-m-d'))
                ->count();
        
            // Calculate the total balance and amounts within the date
            $totalBalance = DB::table('client_billings')
                ->whereDate('created_at', $date->format('Y-m-d'))
                ->sum('balance');
            $totalAmount = DB::table('client_billings')
                ->whereDate('created_at', $date->format('Y-m-d'))
                ->sum('amount');
        
            $balanceDue = $totalBalance - $totalAmount;
        
            // Fetch the count of expired members within the specific date range
            $expiredMembers = DB::table('users')
                ->whereDate('end_date', '<=', $date->format('Y-m-d'))
                ->count();
        
            // Fetch the total expenses within the specific date range
            $expenses = DB::table('expenses')
                ->whereDate('created_at', $date->format('Y-m-d'))
                ->sum('amount');
        
            // Add data to graphData array
            $graphData[] = [
                'date' => $formattedDate,
                'members' => $membersCount,
                'new_leads' => $newLeadCount,
                'balance_due' => $balanceDue,
                'member_expired' => $expiredMembers,
                'expenses' => $expenses,
                'collected' => $totalAmount,
                'sales' => $totalBalance
            ];
        }
        
    
        // Return the graph data
        return response()->json([
            'status' => 1,
            'message' => 'Graph Data Retrieved Successfully',
            'data' => $graphData
        ], 200);
    }
    
     public function clientSubscription(Request $request)
    {
        // return $request;
        $validator = Validator::make($request->all(),[
            // 'name' => 'required|string|max:20',
            // 'surname' => 'required|string|max:20',
            // 'email' => 'required|email',
            // 'mobile' => 'required',
            // 'gender' => 'required',
            // 'paid_amount' => 'required',
            // 'payable_amount' => 'required',
        ]);

        if($validator->fails())
        {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ],422);
        }
        
        $lastSubID = DB::table('subscriptions') 
        ->orderBy('daily_sub_id', 'desc') // Order by `daily_sub_id` in descending order
        ->value('daily_sub_id'); 
        
        $package = DB::table('packages')
        ->where('id',$request->package_id)->first();

        $addClientSub = new Subscription;
        $addClientSub->name = $request->name;
        $addClientSub->daily_sub_id = $lastSubID == null ? 10000 + 1 : $lastSubID + 1;
        $addClientSub->surname = $request->surname;
        $addClientSub->email = $request->email;
        $addClientSub->package_id = $request->package_id;
        $addClientSub->mobile = $request->mobile;
        $addClientSub->gender = $request->gender;
        $addClientSub->date = Carbon::now()->format('Y-m-d');
        $addClientSub->paid_amount = $request->paid_amount;
        $addClientSub->payable_amount = $request->payable_amount; 
        $addClientSub->remark = $request->remark;  
        $addClientSub->type =  $request->type;  //$package->type ?? 1;
        $addClientSub->created_by = Auth::user()->id ?? 1;
        $addClientSub->save();
        
        return response()->json([
            'status' => 1,
            'message' => 'Subscription Added Successfully',
            'data' => $addClientSub
        ],200); 
    }

    public function GetSubscription(Request $request)
    {
         
        $GetSubcription = Subscription::where('id',$request->id)->first();

        if(!$GetSubcription && $request->id)
        {
            return response()->json([
                'status' => 0,
                'message' => 'No subscription found'
            ]);
        }
        else
        {
            if($request->id)
            {
                $GetSubcription = Subscription::where('id',$request->id)->first(); 

                $RemainingAmount = $GetSubcription->payable_amount - $GetSubcription->paid_amount; 
                $GetSubcription->remaining_amount = $RemainingAmount;

                return response()->json([
                    'status' =>1,
                    'message' => 'Get Subscription Details Successfully',
                    'data' => $GetSubcription
                ]); 
            }
            else
            {
                $startDate = $request->filter_startdate;
                $endDate = $request->filter_enddate; 

                if($startDate == null && $endDate == null)
                {
                    
                    if($request->type == 1)
                    {
                        $GetSubcription = Subscription::where('type',1)
                        ->whereNull('deleted_at')
                        // ->OrWhere('type',0)
                        ->latest()->get();
                    }
                    elseif($request->type == 2)
                    {
                        $GetSubcription = Subscription::where('type',2)
                        ->whereNull('deleted_at')
                        // ->OrWhere('type',0)
                        ->latest()->get();
                    }
                    else
                    {
                        if($request->type == null)
                        {
                            $GetSubcription = Subscription::get();
                        }
                    }
                    
                }
                else
                {
                    if($request->type == 1)
                    {
                        $GetSubcription = Subscription::where
                        ('type',1)
                        ->whereBetween('date',[$startDate,$endDate])
                      ->get();
                       
                    }
                    elseif($request->type == 2)
                    {
                        $GetSubcription = Subscription::where('type',2)
                        ->whereBetween('date',[$startDate,$endDate])
                        ->get();
                    } 
                    else
                    {

                        if($request->type == null)
                        {
                            $GetSubcription = Subscription::whereBetween('date',[$startDate,$endDate])->get();
                        } 
                    }
                    
                }

               
                foreach($GetSubcription as $GetSub) 
                {
                    $RemainingAmount = $GetSub->payable_amount - $GetSub->paid_amount;

                    $GetSub->remaining_amount = $RemainingAmount;
                }
                return response()->json([
                    'status' =>1,
                    'message' => 'Get Subscription Details Successfully',
                    'data' => $GetSubcription
                ]); 
            }
        } 

    }
    
    
      public function DeleteSubcription($Delete)
    {
        $deleteSub = Subscription::where('id',$Delete)->first();

        if(!$deleteSub)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Subscription Details not found',
            ],200);
        }
        $deleteSub->update([
            'deleted_at' => Carbon::now()->format('Y-m-d H:i:s'),
            'deleted_by' => Auth::user()->id ?? 1
        ]); 

        return response()->json([
            'status' => 1,
            'message' => 'Subscription Delete Successfully',
        ],200); 
    }
    

       public function GetDeletedDataByType(Request $request)
    {
        $type = $request->type;  
        $startDate = $request->input('start_date') ? Carbon::parse($request->input('start_date')) : null;
        $endDate = $request->input('end_date') ? Carbon::parse($request->input('end_date')) : null;

        if($request->type == 1)
        { 
            $DeleteClientList = User::whereBetween(DB::raw('DATE(deleted_at)'), [$startDate, $endDate])->whereNull('role')->onlyTrashed()->get();
            
            foreach($DeleteClientList as $DeleteClient)
            {
                $CB = DB::table('client_billings')->where('user_id',$DeleteClient->id)->first();
                
                if(!empty($CB))
                {
                    $PackageName = DB::table('packages')->where('id',
                $CB->package_id)->value('package_name');
                }
                
                 
                
                // dd($PackageName);
                 
                $DeleteByName = User::where('id',$DeleteClient->deleted_by)->first(); 
                $DeleteClient->d_date = $DeleteByName != null ? $DeleteClient->deleted_at->format('Y-m-d') : null;  
                $DeleteClient->c_date = $DeleteByName != null ? $DeleteClient->created_at->format('Y-m-d') : null; 
                $DeleteClient->delete_by_name = $DeleteByName != null ? $DeleteByName->name . ' ' . $DeleteByName->surname : null;
                
                $DeleteClient->membershipName = $PackageName ?? 'N/A';
                $DeleteClient->request_type = 'Client';
                
            }
            
            return response()->json([
                'status' =>1,
                'message' => 'Get Client Deleted List Successfully',
                'data' => $DeleteClientList
            ]); 
        }
        elseif($type == 2)
        {
            $DeleteSubList = Subscription::onlyTrashed()->get();

            foreach($DeleteSubList as $DeleteSub)
            { 
                $DeleteByName = User::where('id',$DeleteSub->deleted_by)->first(); 
                $DeleteSub->d_date = $DeleteSub->deleted_at->format('Y-m-d');
                $DeleteSub->c_date = $DeleteSub->created_at->format('Y-m-d');
                $DeleteSub->delete_by_name = $DeleteByName->name . ' ' . $DeleteByName->surname; 
                $DeleteSub->request_type = 'Expense';
                
            }

            return response()->json([
                'status' =>1,
                'message' => 'Get Subscriptions Deleted List Successfully',
                'data' => $DeleteSubList
            ]); 
        }
        elseif($type == 3)
        {
            $DeletePackageList = Package::onlyTrashed()->get();
            foreach($DeletePackageList as $DeletePackage)
            {  

                $DeleteByName = User::where('id',$DeletePackage->deleted_by)->first();
                $DeletePackage->d_date = $DeletePackage->deleted_at->format('Y-m-d');
                $DeletePackage->c_date = $DeletePackage->created_at->format('Y-m-d');
                $DeletePackage->delete_by_name = $DeleteByName != null ? $DeleteByName->name . ' ' . $DeleteByName->surname : null; 
                $DeletePackage->request_type = 'Package';
            }
            return response()->json([
                'status' =>1,
                'message' => 'Get Packages Deleted List Successfully',
                'data' => $DeletePackageList
            ]); 
        }
        elseif($type == 4)
        {
            $DeleteExpensesList = Expenses::whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])->onlyTrashed()->get();
            foreach($DeleteExpensesList as $DeleteExpenses)
            {  

                $DeleteByName = User::where('id',$DeleteExpenses->deleted_by)->first(); 
                $DeleteExpenses->d_date = $DeleteExpenses->deleted_at->format('Y-m-d');
                $DeleteExpenses->c_date = $DeleteExpenses->created_at->format('Y-m-d');
                $DeleteExpenses->delete_by_name = $DeleteByName != null ? $DeleteByName->name . ' ' . $DeleteByName->surname : null; 
                $DeleteExpenses->request_type = 'Expense';
            }
            return response()->json([
                'status' =>1,
                'message' => 'Get Expenses Deleted List Successfully',
                'data' => $DeleteExpensesList
            ]); 
        }
        elseif($type == 5)
        {
            // Daily Cash
            $DeleteSubList = Subscription::onlyTrashed()
            ->where('type',1)
            ->get();

            foreach($DeleteSubList as $DeleteSub)
            { 
                 $PackageName = DB::table('packages')->where('id',
                $DeleteSub->package_id)->value('package_name');
                $DeleteByName = User::where('id',$DeleteSub->deleted_by)->first(); 
                $DeleteSub->d_date = $DeleteSub->deleted_at->format('Y-m-d');
                $DeleteSub->c_date = $DeleteSub->created_at->format('Y-m-d');
                $DeleteSub->delete_by_name = $DeleteByName->name . ' ' . $DeleteByName->surname; 
                $DeleteSub->request_type = 'Daily Client';
                 $DeleteSub->membershipName = $PackageName ?? 'N/A';
            }

            return response()->json([
                'status' =>1,
                'message' => 'Get Daily Cash List Successfully',
                'data' => $DeleteSubList
            ]); 
        } 
        elseif($type == 6)
        {
            // Daily Spa
            $DeleteSubList = Subscription::onlyTrashed()
            ->where('type',2)
            ->get();

            foreach($DeleteSubList as $DeleteSub)
            { 
                $PackageName = DB::table('packages')->where('id',
                $DeleteSub->package_id)->value('package_name');
                $DeleteByName = User::where('id',$DeleteSub->deleted_by)->first(); 
                $DeleteSub->d_date = $DeleteSub->deleted_at->format('Y-m-d');
                $DeleteSub->c_date = $DeleteSub->created_at->format('Y-m-d');
                $DeleteSub->delete_by_name = $DeleteByName->name . ' ' . $DeleteByName->surname; 
                $DeleteSub->request_type = 'Daily SPA';
                 $DeleteSub->membershipName = $PackageName ?? 'N/A';
            }

            return response()->json([
                'status' =>1,
                'message' => 'Get Daily Spa List Successfully',
                'data' => $DeleteSubList
            ]); 
        }
    }
    
      public function AdminApproveAndDisapproveDeleteRequest(Request $request)
    {
         
         // Type 1 for Client
        if($request->approve_disapprove == 1 && $request->type == 1 && $request->user_id)
        { 
            $user = User::where('id', $request->user_id)->onlyTrashed('deleted_at')->first(); 
            $address = Address::where('user_id', $request->user_id)->onlyTrashed('deleted_at')->first();
            $applyCoupn = ApplyCoupon::where('user_id', $request->user_id)->onlyTrashed('deleted_at')->first(); 

            if(!$user)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Client Details not found',
                ],200);
            }
            else
            {
                
                
             // Permanently delete the user
            $user = DB::table('users')
                ->where('id', $request->user_id)
                ->delete();
            
            // Permanently delete the addresses associated with the user
            $address = DB::table('addresses')
                ->where('user_id', $request->user_id)
                ->delete();
            
            // Permanently delete the ApplyCoupon records associated with the user
            $applyCoupon = DB::table('apply_coupons')
                ->where('user_id', $request->user_id)
                ->delete();
                
                $cb = DB::table('client_billings')
                ->where('user_id', $request->user_id)
                ->delete();
                
                $mp = DB::table('members_plans')
                ->where('user_id', $request->user_id)
                ->delete();
                
                
                
                // $user->delete();
                // $address->delete();
                // if($applyCoupn)
                // {
                //     $applyCoupn->delete(); 
                // }
                
    
                return response()->json([
                    'status' => 1,
                    'message' => 'Client Delete Successfully',
                ],200);
            }

            
        }
        elseif($request->approve_disapprove == 2 && $request->type == 1 && $request->user_id)
        {

            $user = User::where('id', $request->user_id)->onlyTrashed('deleted_at')->first(); 
            $address = Address::where('user_id', $request->user_id)->onlyTrashed('deleted_at')->first(); 
            $applyCoupn = ApplyCoupon::where('user_id', $request->user_id)->onlyTrashed('deleted_at')->first();
          
            $user->update([
                'deleted_at' => null, 
                'deleted_by' => \Auth::user()->id ?? 1
            ]);
 
            $address->update([
                    'deleted_at' => null, 
                    'deleted_by' => Auth::user()->id ?? 1
                ]);

            if($applyCoupn)
            {
                $applyCoupn->update([
                    'deleted_at' => null, 
                    'deleted_by' => Auth::user()->id ?? 1
                ]);
            }
           

            return response()->json([
                'status' => 1,
                'message' => 'Request Disapproved by Admin',
            ],200);
        }
         // Type 2 for Subscription
        elseif($request->approve_disapprove == 1 && $request->type == 1 && $request->subscription_id)
        { 
            $deleteSub = Subscription::where('id',$request->subscription_id)->first();
            
            if(!$deleteSub)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Subscription Details not found',
                ],200);
            }
            $deleteSub->delete();
            
            return response()->json([
                'status' => 1,
                'message' => 'Subscription Delete Successfully',
            ],200);
             
        } 
        elseif($request->approve_disapprove == 2 && $request->type == 2 && $request->subscription_id)
        {
            $deleteSub = Subscription::where('id',$request->subscription_id)->onlyTrashed('deleted_at')->first(); 
            if(!$deleteSub)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Subscription Details not found',
                ],200);
            }
            $deleteSub->update([
                'deleted_at' => null,
                'deleted_by' => Auth::user()->id ?? 1
            ]);
            
            return response()->json([
                'status' => 1,
                'message' => 'Subscription Delete Successfully',
            ],200);
        }
        // Type 3 for Package 
        elseif($request->approve_disapprove == 1 && $request->type == 3 && $request->package_id)
        { 
            $Package = Package::where('id', $request->package_id)->first();
            
            if(!$Package)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Package not found',
                ],404);
            }
            else
            { 
                $Package->delete();
    
                return response()->json([
                    'status' => 1,
                    'message' => 'Package Delete Successful',
                ],200);
            } 
             
        } 
        elseif($request->approve_disapprove == 2 && $request->type == 3 && $request->package_id)
        {
            $Package = Package::where('id', $request->package_id)->onlyTrashed('deleted_at')->first();
            //  dd($Package);
            if(!$Package)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Package not found',
                ],404);
            }
            else
            { 
                $Package->update([
                    'deleted_at' => null,
                    'deleted_by' => \Auth::user()->id ?? 1
                ]);
    
                return response()->json([
                    'status' => 1,
                    'message' => 'Package Delete Successful',
                ],200);
            } 
        } 
        // Type 4 for Expenses 
        elseif($request->approve_disapprove == 1 && $request->type == 4 && $request->user_id)
        { 
             $expense = DB::table('expenses')->where('id', $request->user_id)->first();
            
            if (!$expense) {
                return response()->json([
                    'status' => 0,
                    'message' => 'Expense not found',
                ], 404);
            } else {
                DB::table('expenses')->where('id', $request->user_id)->delete();
            
                return response()->json([
                    'status' => 1,
                    'message' => 'Expense deleted successfully',
                ], 200);
            } 
        } 
        elseif($request->approve_disapprove == 2 && $request->type == 4 && $request->user_id)
        {
            
            $expense = Expenses::where('id', $request->user_id)->onlyTrashed('deleted_at')->first(); 
            
           // return $expense;
            if(!$expense)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Expenses not found',
                ],404);
            }
            else
            {
                $expense->update([
                    'deleted_at' => null,
                    'deleted_by' => \Auth::user()->id ?? 1
                ]);
                return response()->json([
                    'status' => 1,
                    'message' => 'Expenses Delete Successful',
                ],200);
            }
        }
        // Type 5 for Daily Cash 
        elseif($request->approve_disapprove == 1 && $request->type == 5 && $request->user_id)
        { 
             $subscription = DB::table('subscriptions')
             ->where('id', $request->user_id)
             ->first();
            
            if (!$subscription) {
                return response()->json([
                    'status' => 0,
                    'message' => 'data not found',
                ], 404);
            } else {
                DB::table('subscriptions')->where('id', $request->user_id)->delete();
            
                return response()->json([
                    'status' => 1,
                    'message' => 'Request Deleted successfully',
                ], 200);
            } 
        } 
        elseif($request->approve_disapprove == 2 && $request->type == 5 && $request->user_id)
        {
            
            $Subscription = Subscription::where('id', $request->user_id)
            ->onlyTrashed('deleted_at')->first();  
           // return $expense;
            if(!$Subscription)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Subscription not found',
                ],404);
            }
            else
            {
                $Subscription->update([
                    'deleted_at' => null,
                    'deleted_by' => \Auth::user()->id ?? 1
                ]);
                return response()->json([
                    'status' => 1,
                    'message' => 'Requested Disapproved successfully',
                ],200);
            }
        }
        // Type 6 for Daily SPA 
        elseif($request->approve_disapprove == 1 && $request->type == 6 && $request->user_id)
        { 
             $subscription = DB::table('subscriptions')
             ->where('id', $request->user_id)
             ->first();
           
            if (!$subscription) {
                return response()->json([
                    'status' => 0,
                    'message' => 'data not found',
                ], 404);
            } else {
                $subscription= DB::table('subscriptions')->where('id', $request->user_id)->delete();
                
                return response()->json([
                    'status' => 1,
                    'message' => 'Request Deleted successfully',
                ], 200);
            } 
        } 
        elseif($request->approve_disapprove == 2 && $request->type == 6 && $request->user_id)
        {
            
            $Subscription = Subscription::where('id', $request->user_id)
            ->onlyTrashed('deleted_at')->first(); 
           
           // return $expense;
            if(!$Subscription)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'Subscription not found',
                ],404);
            }
            else
            {
                $Subscription->update([
                    'deleted_at' => null,
                    'deleted_by' => \Auth::user()->id ?? 1
                ]);
                return response()->json([
                    'status' => 1,
                    'message' => 'Requested Disapproved successfully',
                ],200);
            }
        }
        else
        {
            return response()->json([
                'status' => 0,
                'message' => 'Something went wrong',
            ],200);
        }

    }
    
    public function updatePauseClient(Request $request){
        // return $request;
        if($request->type == 1){
            $updateData= array(
                'pause_date'=> Carbon::now()->format('Y-m-d H:i:s'),
                'paused_days' => $request->number_of_days,
                'suspend_type' => $request->type,
                );
                
            $updatePause = User::where('id',$request->pause_userId)->update($updateData);
        }else{
            $updateData= array(
                'pause_date'=> Carbon::now()->format('Y-m-d H:i:s'),
                'paused_days' => $request->number_of_days ?? 0,
                'suspend_type' => $request->type,
                );
            $updatePause = User::where('id',$request->pause_userId)->update($updateData);
        }
        
        if($updatePause){
            return response()->json([
                    'status' => 1,
                    'message' => 'Requested updated successfully',
                ],200);
        }else{
            return response()->json([
                'status' => 0,
                'message' => 'Something went wrong',
            ],200);
        }
       
        
    }
    
    
    public function updateActiveAccountClient(Request $request){
        if(isset($request->clientId) && isset($request->pause_userId)){
            
            
            $userDetails = DB::table('users')->where('id',$request->pause_userId)->first();
            $today = Carbon::now();
            $clientBillingDetails = DB::table('client_billings')->where('user_id',$request->pause_userId)->orderBy('id','DESC')->first();
            // return $clientBillingDetails;
            
            if(!empty($userDetails)){
                if($userDetails->end_date > $userDetails->pause_date){
                    $pauseDate = Carbon::parse($userDetails->pause_date); // Convert pause_date to Carbon instance
                    $daysDifference = $pauseDate->diffInDays(Carbon::now());
                    
                    $endDate = Carbon::parse($userDetails->end_date); // Convert end_date to Carbon instance
                    $updatedEndDate = $endDate->addDays($daysDifference); // Add the $daysDifference to end_date
                    if($userDetails->suspend_type == 1){
                         if($daysDifference > 0){
                            $updateData = array(
                            'end_date' => $updatedEndDate,
                            'pause_date' => NULL,
                            'paused_days' => 0,
                            'suspend_type' => 0,
                            );
                          $updateUser = DB::table('users')->where('id',$request->pause_userId)->update($updateData);
                          $clientBillingDetails = DB::table('client_billings')->where('user_id',$request->pause_userId)->orderBy('id','DESC')->update(['end_date'=>$updatedEndDate]);
                        }
                    }else{
                         $updateData = array(
                            'pause_date' => NULL,
                            'paused_days' => 0,
                            'suspend_type' => 0,
                            );
                          $updateUser = DB::table('users')->where('id',$request->pause_userId)->update($updateData);
                    }
                   
                   
                return response()->json([
                    'status' => 1,
                    'message' => 'Requested updated successfully',
                ],200);
                    
                }
            }
            return response()->json([
                    'status' => 1,
                    'message' => 'This Account Actived successfully!',
                ],200);
        }else{
            return response()->json([
                'status' => 0,
                'message' => 'Go back and try again!',
            ],200);
        }
    }

    public function setDeviceIP(Request $request){
        // return $request;
        $data=array(
            'name'=>$request->start_date,
            'ip'=>$request->end_date,
            'created_at'=> Carbon::now(),
            );
        DB::table('finger_devices')->insert($data);
         $devices= DB::table('finger_devices')->get();
        
         return response()->json([
                    'status' => 1,
                    'message' => 'Device Added successfully!',
                    'data'=>$devices,
                ],200);
    }
    
    
    public function getDeviceIP(){
       $devices= DB::table('finger_devices')->get();
         return response()->json([
                    'status' => 1,
                    'message' => 'Device get successfully!',
                    'data'=>$devices,
                ],200);
    }
    
    
    
    public function updateDeviceIP(Request $request){
        // return $request;
       $data=array(
            'name'=>$request->deviceName,
            'ip'=>$request->deviceIP,
            );
        $updateDive=DB::table('finger_devices')->where('id',$request->id)->update($data);
        return response()->json([
                    'status' => 1,
                    'message' => 'Device Update successfully!',
                    // 'data'=>$devices,
                ],200);
    }
    
    public function deleteDeviceIP(Request $request){
        // return $request;
         $updateDive=DB::table('finger_devices')->where('id',$request->user_id)->delete();
        return response()->json([
                    'status' => 1,
                    'message' => 'Device Delete successfully!',
                    // 'data'=>$devices,
                ],200);
    }
}
