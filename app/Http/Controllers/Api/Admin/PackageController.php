<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Center;
use App\Models\User;
use App\Models\Package;
use Validator;
use App\Models\MembersPlans;
use Illuminate\Support\Facades\Response;
use Carbon\Carbon;
use App\Models\Coupon;
use App\Models\RenewPackage; 
use App\Models\ApplyCoupon;




class PackageController extends Controller
{
    //
      public function GetPackage(Request $request, $package_id = null)
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

        $packages = Package::get();

        $packageGet = Package::where('id',$package_id)->first();
        
        if($packageGet)
        {
            // $centerName = \DB::table('centers')->where('id',$packageGet->center_id)->first(); 
            //     $packageGet->center_name = $centerName->name ?? null; ;

           $packageGet->c_date = \Carbon\Carbon::parse($packageGet->created_at)->format('Y-m-d H:i:s');

 
                // if( $packageGet->training_type == 1)
                // {
                //     $packageGet->training_type = 'Without Trainer';
                // }
                // elseif( $packageGet->training_type == 2)
                // {
                //     $packageGet->training_type = 'With Trainer';
                // }  

                if($packageGet->package_timing == 1)
                {
                    $packageGet->package_timing = \Str::title('normal hours');
                }
                elseif($packageGet->package_timing == 2)
                {
                    $packageGet->package_timing = \Str::title('sunny hours');
                }

                // if($packageGet->package_type == 1)
                // {
                //     $packageGet->package_type = \Str::title('main');
                // }
                // elseif($packageGet->package_type == 2)
                // {
                //     $packageGet->package_type = \Str::title('add on');
                // } 
            return Response::json([
                'status' => 1,
                'message' => 'Packages Get Successfully', 
                'data' =>  $packageGet,
                
            ]);
        }

 
        // if($request->center_id)
        // {
        //     $CenterPakages = Package::where('center_id',$request->center_id)->get();

        //     foreach($CenterPakages as $center)
        //     {
        //         $centerName = \DB::table('centers')->where('id',$request->center_id)->first();
        //         // dd($centerName);
        //         $center->center_name = $centerName->name;
        //     }

        //     if(!$CenterPakages->isEmpty()) 
        //     return Response::json([
        //         'status' => 1,
        //         'message' => 'Packages Get Successfully', 
        //         'data' => [
        //             'packages' => $CenterPakages
        //         ]
        //     ]);
        //     else
        //     return Response::json([
        //         'status' => 0,
        //         'message' => 'No Packages Available', 
        //     ]);

        // }
        else
        if(!$packages->isEmpty())  
        {
            
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page 
            
            $packages = Package::latest()->paginate($limit, ['*'], 'page', $page);

            $search = $request->search; 
            $packageSearch = Package::where('package_name','LIKE',"%$search%")
            ->Orwhere('price','LIKE',"%$search%")
            ->Orwhere('training_type','LIKE',"%$search%")
            ->get();
            // ->paginate($limit, ['*'], 'page', $page);

              
            if($packageSearch->isEmpty())
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'No Data Found', 
                ],200);
            } 
            
            foreach($packageSearch as $center)
            {
                $formattedDate = \Carbon\Carbon::parse($center->created_at)->format('Y-m-d H:i:s');
                

                 $center->c_date = $formattedDate;
                
               
                $centerName = \DB::table('centers')->where('id',$center->center_id)->first(); 
                $center->center_name = $centerName->name ?? null;;

                if( $center->training_type == 1)
                {
                    $center->training_type = 'Both';
                }
                elseif( $center->training_type == 2)
                {
                    $center->training_type = 'Male';
                }  
                elseif( $center->training_type == 3)
                {
                    $center->training_type = 'Female';
                }  

                if($center->package_timing == 1)
                {
                    $center->package_timing = \Str::title('normal hours');
                }
                elseif($center->package_timing == 2)
                {
                    $center->package_timing = \Str::title('sunny hours');
                }

                if($center->package_type == 1)
                {
                    $center->package_type = \Str::title('main');
                }
                elseif($center->package_type == 2)
                {
                    $center->package_type = \Str::title('add on');
                }
            }
            
            
            foreach($packages as $center)
            {
                
                $formattedDate = \Carbon\Carbon::parse($center->created_at)->format('Y-m-d H:i:s');
                

                 $center->c_date = $formattedDate;
                
               
                $centerName = \DB::table('centers')->where('id',$center->center_id)->first(); 
                $center->center_name = $centerName->name ?? null;;

                if( $center->training_type == 1)
                {
                    $center->training_type = 'Both';
                }
                elseif( $center->training_type == 2)
                {
                    $center->training_type = 'Male';
                }  
                elseif( $center->training_type == 3)
                {
                    $center->training_type = 'Female';
                }  

                if($center->package_timing == 1)
                {
                    $center->package_timing = \Str::title('normal hours');
                }
                elseif($center->package_timing == 2)
                {
                    $center->package_timing = \Str::title('sunny hours');
                }

                if($center->package_type == 1)
                {
                    $center->package_type = \Str::title('main');
                }
                elseif($center->package_type == 2)
                {
                    $center->package_type = \Str::title('add on');
                }

            }
            
            //for pagination
              foreach($packages as $package)
            {
                $formattedDate = \Carbon\Carbon::parse($package->created_at)->format('Y-m-d H:i:s');
                
                // dd($formattedDate);
                
                $package->c_date = $formattedDate;
            }
                 

            // Extract the query string part for pagination URLs
            $firstPageUrl = parse_url($packages->url(1), PHP_URL_QUERY) ? '/?' . parse_url($packages->url(1), PHP_URL_QUERY) : null;
            $nextPageUrl = $packages->nextPageUrl() ? '/?' . parse_url($packages->nextPageUrl(), PHP_URL_QUERY) : null;
            $prevPageUrl = $packages->previousPageUrl() ? '/?' . parse_url($packages->previousPageUrl(), PHP_URL_QUERY) : null;

            // Prepare the pagination links in the specified format
            $formattedLinks = [];

            foreach ($packages->linkCollection() as $link) {
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
                        'url' => $url === $prevPageUrl || $url === $nextPageUrl ? $url : $pageNumber,
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
                'from' => $packages->firstItem(),
                'to' => $packages->lastItem(),
                'items_per_page' => $limit,
                'last_page' => $packages->lastPage(),
                'links' => $formattedLinks, // Use the formatted links
                'next_page_url' => $nextPageUrl,
                'page' => (int) $page, // Ensure the page number is sent as an integer
                'prev_page_url' => $prevPageUrl,
                'total' => $packages->total(), // Get the total number of items
            ];


            // Extract pagination data
            // $pagination = [
            //     'current_page' => $packages->currentPage(),
            //     'first_page_url' => $packages->url(1),
            //     'from' => $packages->firstItem(),
            //     'last_page' => $packages->lastPage(),
            //     'last_page_url' => $packages->url($packages->lastPage()),
            //     'next_page_url' => $packages->nextPageUrl(),
            //     'path' => $packages->path(),
            //     'per_page' => $packages->perPage(),
            //     'prev_page_url' => $packages->previousPageUrl(),
            //     'to' => $packages->lastItem(),
            //     'total' => $packages->total(),
            // ];
  

            return Response::json([
                'status' => 1,
                'message' => 'Packages Get Successfully', 
                'data' =>  $request->search == null ? $packages->items() : $packageSearch,
                'payload' => [
                    'pagination' => $pagination
                ]
                
            ]);
        } 
        else{
            return Response::json([
                'status' => 0,
                'message' => 'No Packages Available', 
            ]);
        }
       
    }

    public function AddUpdatePackage(Request $request, $id = null)
    {
        
        //  return $request->id;
        // Define the validation rules
        $validator = Validator::make($request->all(), [
            'package_name' => 'required|string|max:255',
            'price' => 'required|numeric',
            // 'center_id' => 'required|integer|exists:centers,id',
            'no_of_days' => 'required|integer',
             'training_type' => 'required',
            // 'package_type' => 'required|in:1,2',
            // 'show_at_advicefit_platform' => 'nullable|boolean',
            // 'status' => 'required|in:1,2',
        ]);  
        
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Check if a package with the same name already exists
        $package = Package::
                        // where('package_name', $request->input('package_name'))
                        // ->where('center_id', $request->input('center_id'))
                        where('id',$request->id)
                        ->first();

        if ($package) {
           
            // If a package exists and the $id is null or matches the existing package ID, update it
            if (!$id || $id == $package->id) {
                // Update the package
                $package->price = $request->input('price');
                $package->package_name = $request->input('package_name');
                // $package->product_type = $request->input('product_type');
                $package->no_of_days = $request->input('no_of_days');
                 $package->training_type = $request->input('training_type');
                // $package->package_timing = $request->input('package_timing');
                $package->package_type = $request->input('package_type');
                $package->type = $request->input('type') ?? '0';
                // $package->show_at_advicefit_platform = $request->input('show_at_advicefit_platform') ?? 0;
                 $package->status = $request->input('status');
                $package->updated_by = \Auth::user()->id ?? 1;
                $package->save();

                return response()->json([
                    'status' => 1,
                    'message' => 'Package updated successfully',
                    'data' => ['package' => $package]
                ], 200);
            }
        } else {
              
            // If no package with the same name exists, create a new one
            $package = new Package;
            $package->package_name = $request->input('package_name');
            $package->price = $request->input('price');
            // $package->center_id = $request->input('center_id');
            // $package->product_type = $request->input('product_type');
            $package->no_of_days = $request->input('no_of_days');
            $package->training_type = $request->input('training_type');
            $package->type = $request->input('type') ?? '0';
            // $package->package_timing = $request->input('package_timing');
            // $package->package_type = $request->input('package_type');
            // $package->show_at_advicefit_platform = $request->input('show_at_advicefit_platform') ?? 0;
            $package->created_by = \Auth::user()->id ?? 1;
            $package->status = $request->input('status') ?? 0;
            $package->save();

            return response()->json([
                'status' => 1,
                'message' => 'Package saved successfully',
                'data' => ['package' => $package]
            ], 200);
        }

        // If $id doesn't match and package name already exists, throw an error
        return response()->json([
            'status' => 0,
            'message' => 'Package name already exists in another record.'
        ], 422);
    }
    
    public function cancelMemberPackage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'package_id' => 'required',
            'api_key' => 'required| in:1'
            
        ]); 

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
            ], 422);
        } 
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Validation accuracy check failed',  
            ], 422);
        }

        $CancelPackage = MembersPlans::where(
            'package_id', $request->package_id)
            ->where('user_id', $request->user_id)
            ->update([
                'status' => 2
            ]);

        if($CancelPackage)
        {
             // Return a successful response
            return response()->json([
                'status' => 1,
                'message' => 'Package Cancelled Successfully',  
            ],200);
        }
        else
        {
             // Return a unsuccessful response
            return response()->json([
                'status' => 0,
                'message' => 'Not Package Found',  
            ],200);
        }
    }

    public function UpdateMemberPackage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required', 
        ]);


        // Conditionally add 'package_id' validation rule
        if (is_null($request->date_from) || is_null($request->date_to) || is_null($request->manual_price)) {
            $validator = Validator::make($request->all(), [ 
                 'package_id' => 'required', 
            ]);
        }
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Validation accuracy check failed',  
            ], 422);
        }
 
         
        if($request->center_id && $request->date_from != null) {
            return response()->json([
                'status' => 0,
                'message' => 'To select a date, please remove the package selection first.', 
            ], 400);
        }  

        $memberPackage = Package::where('id',$request->package_id)->first();
        $MemberCenterID = User::where('id',$request->user_id)->value('center_id');

        $assignMemberID = MembersPlans::where('user_id',$request->user_id) 
        ->latest()->value('assigned_users_id');
         

        $MembersPlans = MembersPlans::where('user_id',$request->user_id)
        ->where('status',1)
         // ->latest()
        // ->orderBy('id','desc')
        ->first(); 
        if($MembersPlans && $MembersPlans->status == 1) {
            
            if($request->assigned_users_id == null && $MembersPlans->status == 1 || $request->package_id == null && $request->assigned_users_id == null)
            {
                return response()->json([
                    'status' => 0,
                    'message' => 'You have already selected a membership plan.', 
                ], 405);
            }

            $MembersPlansUpdate = MembersPlans::where('user_id',$request->user_id)
            ->where('status',1)
            ->update([
                'assigned_users_id' => $request->assigned_users_id ?? $MembersPlans->assigned_users_id
            ]); 
            
            return response()->json([
                'status' => 1,
                'message' => 'Trainee updated successfully', 
            ], 200); 
        }   
               
        // dd('asd');
        if($request->date_from && $request->date_to)
        {
            $dateFrom = Carbon::parse($request->date_from);
            $dateTo = Carbon::parse($request->date_to);
            $noOfDays = $dateFrom->diffInDays($dateTo); 
        } 

        $membersPlan = new MembersPlans();
        $membersPlan->user_id = $request->user_id;
        $membersPlan->package_id = $request->package_id ?? 0;
        $membersPlan->package_name = $memberPackage->package_name ?? 'Manual Package';
        $membersPlan->price = $memberPackage->price ?? $request->manual_price;
        $membersPlan->center_id = $MemberCenterID;
        $membersPlan->no_of_days = $memberPackage->no_of_days ?? $noOfDays;
        $membersPlan->product_type = $memberPackage->product_type ?? $request->product_type;
        $membersPlan->training_type = $memberPackage->training_type ?? $request->training_type;
        $membersPlan->package_timing = $memberPackage->package_timing ?? $request->package_timing;
        $membersPlan->package_type = $memberPackage->package_type ?? $request->package_type;
        $membersPlan->show_at_advicefit_platform = $memberPackage->show_at_advicefit_platform ?? $request->show_at_advicefit_platform;
        $membersPlan->status = $memberPackage->status ?? $request->package_status;
        $membersPlan->date_from = $request->date_from ?? $memberPackage->date_from;
        $membersPlan->date_to = $request->date_to ?? $memberPackage->date_to;
        $membersPlan->manual_price = $request->manual_price ?? $memberPackage->manual_price;
        $membersPlan->membership_type = $memberPackage->membership_type ?? 0;
        $membersPlan->assigned_users_id = $assignMemberID ?? $request->assigned_users_id;

        if($request->apply_coupon_id)
        {
            
            $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
 
            $package = MembersPlans::where('id',$request->package_id)->first(); 

            $discountAmount = ($package->price * $coupon->percentage) / 100; 
                
            $finalPrice = $package->price - $discountAmount;  

            $ApplyCoupon = ApplyCoupon::create([
                'user_id' => $request->user_id,
                'package_id' => $request->package_id,
                'discount_price' => $discountAmount,
                'final_price' => $finalPrice,
                'coupon_id' => $request->apply_coupon_id,
                'applied_at' => Carbon::now(), 
            ]);
        }
        
            
        $membersPlan->save();

        if($membersPlan)
        {
             // Return a successful response
            return response()->json([
                'status' => 1,
                'message' => 'User Package Updated Successfully',  
            ],200);
        }
        else
        {
             // Return a unsuccessful response
            return response()->json([
                'status' => 0,
                'message' => 'Not Package Found',  
            ],400);
        }
    }
    
    public function RenewMemberPackage(Request  $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required', 
            'package_id' => 'required', 
        ]);
 
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => 'Validation accuracy check failed',  
            ], 422);
        }
  
        $renewMembershipPlan = MembersPlans::where('user_id',$request->user_id)
        ->where('package_id',$request->package_id)->where('status',1)->first(); 

        if($renewMembershipPlan)
        {
            if($request->renew_start_date && $request->renew_end_date)
            { 

                if($request->apply_coupon_id)
                {

                    
                    $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
                    
                    $applyCouponID = ApplyCoupon::where('coupon_id',$request->apply_coupon_id)->value('coupon_id');
                    
                    if($applyCouponID && $applyCouponID !== null)
                    {
                        return response()->json([
                            'status' => 0,
                            'message' => 'You Have Already Use this Coupon Code!',  
                        ], 422);
                    }  
                    $package = MembersPlans::where('package_id',$request->package_id)->first(); 
                    // dd($package);
                    $discountAmount = ($package->price * $coupon->percentage) / 100; 
                        
                    $finalPrice = $package->price - $discountAmount;  
    
                    $ApplyCoupon = ApplyCoupon::create([
                        'user_id' => $request->user_id,
                        'package_id' => $request->package_id,
                        'discount_price' => $discountAmount,
                        'final_price' => $finalPrice,
                        'coupon_id' => $request->apply_coupon_id,
                        'applied_at' => Carbon::now(), 
                    ]);

                    $dateFrom = Carbon::parse($request->renew_start_date);
                    $dateTo = Carbon::parse($request->renew_end_date);
                    $noOfDays = $dateFrom->diffInDays($dateTo); 
                        
                    $RenewPlan =  RenewPackage::create([
                        'user_id' => $request->user_id,
                        'package_id' => $request->package_id,
                        'renew_start_date' => $request->renew_start_date,
                        'renew_end_date' => $request->renew_end_date,
                        'renew_no_of_days' => $noOfDays, 
                        'coupon_id' => $request->apply_coupon_id

                    ]);
                }
                else { 

                    $applyCouponID = ApplyCoupon::where('coupon_id',$request->apply_coupon_id)->value('coupon_id');
                    
                    if($applyCouponID && $applyCouponID !== null)
                    {
                        return response()->json([
                            'status' => 0,
                            'message' => 'You Have Already Use this Coupon Code!',  
                        ], 422);
                    }  

                    $dateFrom = Carbon::parse($request->renew_start_date);
                    $dateTo = Carbon::parse($request->renew_end_date);
                    $noOfDays = $dateFrom->diffInDays($dateTo); 
                        
                    $RenewPlan =  RenewPackage::create([
                        'user_id' => $request->user_id,
                        'package_id' => $request->package_id,
                        'renew_start_date' => $request->renew_start_date,
                        'renew_end_date' => $request->renew_end_date,
                        'renew_no_of_days' => $noOfDays,  
                        'coupon_id' => null
                    ]);
                }

            } 

              // Return a successful response
              return response()->json([
                'status' => 1,
                'message' => 'Your Package Renew Succssfully',  
              ],200);
         } 
        else
        {
             // Return a unsuccessful response
            return response()->json([
                'status' => 0,
                'message' => 'Not Package Found',  
            ],400);
        }
    }
    
    public function DeletePackage(Request $request, $package_id)
    {
        $Package = Package::where('id', $package_id)->first();
         
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
                'deleted_at' => date('Y-m-d H:i:s'),
            ]);

            return response()->json([
                'status' => 1,
                'message' => 'Package Delete Successful',
            ],200);
        } 
    }
    
    public function GetPackageByClient(Request $request)
    {
        // Retrieve the client details from the 'users' table
        $client = \DB::table('users')->where('client_id', $request->client_id)
        ->whereNull('deleted_at')
        ->first();

        if (!$client) {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid client ID provided'
            ], 200);
        }

        // Determine the gender value for package filtering
        $genderType = null;
         if ($client->gender == 'Both') {
             $genderType = 1;
         } elseif ($client->gender == 'Male') {
             $genderType = 2;
         } elseif ($client->gender == 'Female') {
             $genderType = 3;
         }

        // if ($client->gender == 'male') {
        //     $genderType = 2;
        // } elseif ($client->gender == 'Female') {
        //     $genderType = 3;
        // }

        // Fetch the packages that match the gender type
        $packages = \DB::table('packages')
            ->whereIn('training_type', [1, $genderType]) // 1 for Both + gender-specific type
            // ->select('package_name','id')
            ->where('deleted_at',null)
            ->get();

        if ($packages->isEmpty()) {
            return response()->json([
                'status' => 0,
                'message' => 'No packages found for the given client and gender'
            ], 200);
        }

        return response()->json([
            'status' => 1,
            'message' => 'Get Package Successfully', 
            'data' => $packages

        ], 200);
    }
    
     public function GetPackageForDropdown(Request $request, $package_id = null)
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

        $packages = Package::get();

        $packageGet = Package::where('id',$package_id)->first();
        if($packageGet)
        {
            $centerName = \DB::table('centers')->where('id',$packageGet->center_id)->first(); 
                $packageGet->center_name = $centerName->name ?? null;

                $packageGet->c_date = \Carbon\Carbon::parse($packageGet->created_at)->format('Y-m-d H:i:s');


                // if( $packageGet->training_type == 1)
                // {
                //     $packageGet->training_type = 'Without Trainer';
                // }
                // elseif( $packageGet->training_type == 2)
                // {
                //     $packageGet->training_type = 'With Trainer';
                // }  

                if($packageGet->package_timing == 1)
                {
                    $packageGet->package_timing = \Str::title('normal hours');
                }
                elseif($packageGet->package_timing == 2)
                {
                    $packageGet->package_timing = \Str::title('sunny hours');
                }

                // if($packageGet->package_type == 1)
                // {
                //     $packageGet->package_type = \Str::title('main');
                // }
                // elseif($packageGet->package_type == 2)
                // {
                //     $packageGet->package_type = \Str::title('add on');
                // } 
            return Response::json([
                'status' => 1,
                'message' => 'Packages Get Successfully', 
                'data' =>  $packageGet,
                
            ]);
        }

 
        // if($request->center_id)
        // {
        //     $CenterPakages = Package::where('center_id',$request->center_id)->get();

        //     foreach($CenterPakages as $center)
        //     {
        //         $centerName = \DB::table('centers')->where('id',$request->center_id)->first();
        //         // dd($centerName);
        //         $center->center_name = $centerName->name;
        //     }

        //     if(!$CenterPakages->isEmpty()) 
        //     return Response::json([
        //         'status' => 1,
        //         'message' => 'Packages Get Successfully', 
        //         'data' => [
        //             'packages' => $CenterPakages
        //         ]
        //     ]);
        //     else
        //     return Response::json([
        //         'status' => 0,
        //         'message' => 'No Packages Available', 
        //     ]);

        // }
        else
        if(!$packages->isEmpty())  
        {
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page 
            
            $packages = Package::latest()->get();

            foreach($packages as $center)
            {
               
                 

                $centerName = \DB::table('centers')->where('id',$center->center_id)->first(); 
                $center->center_name = $centerName->name ?? null;
                $formattedDate = \Carbon\Carbon::parse($center->created_at)->format('Y-m-d H:i:s');
                
                $center->c_date = $formattedDate;
                // dd($center->c_date);
                if( $center->training_type == 1)
                {
                    $center->training_type = 'Both';
                }
                elseif( $center->training_type == 2)
                {
                    $center->training_type = 'Male';
                }  
                elseif( $center->training_type == 3)
                {
                    $center->training_type = 'Female';
                }  

                if($center->package_timing == 1)
                {
                    $center->package_timing = \Str::title('normal hours');
                }
                elseif($center->package_timing == 2)
                {
                    $center->package_timing = \Str::title('sunny hours');
                }

                if($center->package_type == 1)
                {
                    $center->package_type = \Str::title('main');
                }
                elseif($center->package_type == 2)
                {
                    $center->package_type = \Str::title('add on');
                }

            }

            // Extract pagination data
            // $pagination = [
            //     'current_page' => $packages->currentPage(),
            //     'first_page_url' => $packages->url(1),
            //     'from' => $packages->firstItem(),
            //     'last_page' => $packages->lastPage(),
            //     'last_page_url' => $packages->url($packages->lastPage()),
            //     'next_page_url' => $packages->nextPageUrl(),
            //     'path' => $packages->path(),
            //     'per_page' => $packages->perPage(),
            //     'prev_page_url' => $packages->previousPageUrl(),
            //     'to' => $packages->lastItem(),
            //     'total' => $packages->total(),
            // ];
  

            return Response::json([
                'status' => 1,
                'message' => 'Packages Get Successfully', 
                'data' =>  $packages,
                // 'payload' => [
                //     'pagination' => $pagination
                // ]
                
            ]);
        } 
        else{
            return Response::json([
                'status' => 0,
                'message' => 'No Packages Available', 
            ]);
        }
       
    }
}
