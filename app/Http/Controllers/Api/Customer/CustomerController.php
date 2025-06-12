<?php

namespace App\Http\Controllers\Api\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\User;
use App\Models\MembersPlans;
use App\Models\ApplyCoupon;
use App\Models\Package;
use App\Models\City;
use App\Models\State;
use App\Models\Coupon;
use Illuminate\Support\Facades\Response;
use Auth;
use DB;
use Carbon\Carbon;
use App\Models\RenewPackage; 
use App\Models\Billing;
use App\Models\Member;



class CustomerController extends Controller
{
    public function customerLogin(Request $request)
    {
        // Validate input fields
        $validator = Validator::make($request->all(), [
            'country_code' => 'required',
            'number' => 'required|string',
            'password' => 'required|string',
        ]);

        // If validation fails, return the errors
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        }

        // Get login credentials
        $credentials = [
            'mobile_number' => $request->number, // Use the correct column name for the mobile number
            'password' => $request->password
        ];

       

        // Check if the customer exists based on the provided mobile number
        $customer = User::where('country_code', $request->country_code)
        ->where('mobile_number', $request->number)
        ->first();
        
         
        
        if (!$customer) {
            return response()->json([
                'status' => 0,
                'message' => 'Customer not found. Please check your number.',
            ], 200);
        }

        // Attempt to authenticate the user with the credentials
        if (Auth::attempt($credentials)) {
            $customer = Auth::user();

            // Delete existing tokens if any
           // $customer->tokens()->delete();

            // Create a new token for the authenticated user
            $token = $customer->createToken('auth_token')->plainTextToken;

            // Log the user in
            Auth::login($customer);

            // Return success response with the generated token and user data
            return response()->json([
                'status' => 1,
                'message' => 'User logged in successfully',
                'api_token' => $token,
                'data' => [
                    'user' => $customer
                ]
            ]);
        } else {
            // Return error if credentials are invalid
            return response()->json([
                'status' => 0,
                'message' => 'Invalid number or password. Please check your credentials.',
            ], 200);
        }
    }

    public function customerProfile(Request $request, $customer_id)
    {
        $getCustomerProfile = User::where('id',$customer_id)->first();
         

        if(!$getCustomerProfile)
        {
            return response()->json([
                'status' => 0,
                'message' => 'customer not found',
            ],200);
        } 
         $UserDetails = User::where('users.id', $customer_id) 
                ->join('centers', 'centers.id', 'users.center_id')
                // ->join('roles', 'roles.id', 'users.role')
                ->join('addresses as a', 'a.user_id', 'users.id')
                ->join('members_plans as mp', 'users.id', 'users.id')
                ->select(
                    'users.*', 
                    'a.city_id as city_name',
                    'a.state_id as state_name',
                    'a.address_first',
                    'centers.name as center_name',
                    'address_line_1',
                    'address_line_2',
                    'a.pincode',
                    'centers.city_id as center_city_name',
                    'centers.state_id as center_state_name'
                    // 'roles.name as role_name'
                    //'mp.package_name'
                )
                ->first();
  
            if ($UserDetails) {
                 
                
                // Fetch city and state names
                $UserDetails->center_city_name = City::where('id', $UserDetails->center_city_name)->value('name'); 
                $UserDetails->center_state_name = State::where('id', $UserDetails->center_state_name)->value('name');
                $UserDetails->shift_name = DB::table('shifts')->where('id', $UserDetails->shift_id)->value('shift_name');  

                $UserDetails->address_first = $UserDetails->address_line_1.','.$UserDetails->center_city_name.','.$UserDetails->center_state_name . ','.$UserDetails->pincode;
                // $UserDetails->remaining_days = Carbon::parse($UserDetails->starting_date)->diffInDays(Carbon::parse($UserDetails->end_date), false);
                
                 $package = DB::table('members_plans')->where('user_id',$customer_id)->first();
                
                $today = Carbon::now();  // Get today's date3

                // $startDate = Carbon::parse($UserDetails->starting_date); // Parse the end date
                //  dd($today);
                $endDate = Carbon::parse($UserDetails->end_date); // Parse the end date

                // Calculate remaining days (end_date - today)
                $package->remaining_days = $today->diffInDays($endDate, false); // 'false' allows negative values if the end date has passed
                  
    
                $userData[] = $UserDetails;
                return Response::json([
                    'status' => 1,
                    'message' => 'Get User Details Successfully',
                    'data' => [
                        'user' => $UserDetails,
                        'package' => $package
                ]]);
                
            } else {
                return Response::json([
                    'status' => 0,
                    'message' => 'No User Available'
                ], 200);
            } 

    }
    
    public function UserLogout(Request $request)
    {
        $user =  $request->user()->currentAccessToken()->delete();
        
        if(!$user){
                return response()->json([
                'status' => 0,
                'message' => 'User not logged out',
            ],200);
        }

        return response()->json([
            'status' => 1,
            'message' => 'User logged out successfully',
        ],200);
    
    }

}
