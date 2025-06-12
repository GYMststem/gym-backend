<?php

namespace App\Http\Controllers\Api\Manager;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\User; 
use Carbon\Carbon; 
use Str;
use Auth;
use DB;

class ManagerController extends Controller
{

    public function ManagerRegister(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'number' => 'required | digits:10',
            'country_code' => 'required|regex:/^\+\d{1,3}$/',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        } 

         $Manager = User::where('mobile_number',$request->number)
        ->where('country_code',$request->country_code)
        ->first(); 
        
        // Check if the number exists with a different country code
        $ManagerWithDifferentCode = User::where('mobile_number', $request->number)
        ->where('country_code', '!=', $request->country_code)
        ->first();

        
        if($Manager)
        {
            return response()->json([
                'status' => 0,
                'message' => 'This number already exists please try another number.'
            ], 200);
        } 
        if ($ManagerWithDifferentCode) {
            return response()->json([
            'status' => 0,
            'message' => 'This number exists with a different country code.'
            ], 200);
        }
 
        $otp = rand(1000, 9999);
         
        $managerData = User::create([
            'country_code' => $request->country_code,
            'mobile_number' => $request->number,
            'otp' => $otp,
            'otp_created_at' => Carbon::now(),
            'password' => \Hash::make($request->password),
            'status' => 1,
            'otp_verified' => 0,
        ]);

        $managerData['otp'] = $otp . ' Valid for one minute';
    

        return response()->json([
            'status' => 1,
            'message' => 'Member Register Succssfully',
            'data' => $managerData
        ],200);
        
    }

    //
    public function SendOtp(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'number' => 'required',
            'country_code' => 'required|regex:/^\+\d{1,3}$/',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        }

        $Manager = User::where('mobile_number',$request->number)->where('country_code',$request->country_code)->first(); 
        if(!$Manager)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid Mobile Number'
            ], 200);
        }
        else
        {
            $otp = rand(1000, 9999);

            $userOtp = User::where('mobile_number',$request->number)->update([
                'otp' => $otp,
            ]);

            return response()->json([
                'status' => 1,
                'message' => 'Otp Send Successfully',
                'data' => [
                    'otp' => $otp,
                ]
            ],200);
        }
    }


    public function verifyOtp(Request $request)
    {
        $validator =Validator::make($request->all(),[
            'verify_otp' => 'required | min:4 |regex:/^[0-9]+$/', // Only allows numeric digits, no special characters or letters'
        ]);


        if($validator->fails())
        {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        }

        $Manager = User::where('otp',$request->verify_otp)->first(); 
 
        if(!$Manager)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid Otp'
            ], 200);
        }
        else
        {
            // Check if the OTP was created within the last 1 minute
            $otpCreationTime = $Manager->otp_created_at;
            $currentTime = now();

            // Check if the difference in minutes is greater than 1
            if ($otpCreationTime && $currentTime->diffInMinutes($otpCreationTime) > 1) {
                return response()->json([
                    'status' => 0,
                    'message' => 'OTP has expired. Please request a new one.'
                ], 200);
            }
            
            $userOtp = User::where('otp',$request->verify_otp)->update([ 
                'otp_verified' => 1,
            ]);

            return response()->json([
                'status' => 1,
                'message' => 'Otp Verify Successfully',
                // 'data' => [
                //     'user' => $Manager,
                // ]
            ],200);
        }

    }

    public function resendOtp(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'number' => 'required',
            'country_code' => 'required|regex:/^\+\d{1,3}$/',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        }

        $Manager = User::where('mobile_number',$request->number)->where('country_code',$request->country_code)->first(); 
        if(!$Manager)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid Mobile Number'
            ], 200);
        }
        else
        {
            $otp = rand(1000, 9999);
            
            $userOtp = User::where('mobile_number',$request->number)->update([
                'otp' => $otp,
                'otp_created_at' => Carbon::now(),
                'otp_verified' => 0,
            ]);
 

            return response()->json([
                'status' => 1,
                'message' => 'Otp resend Successfully',
                'data' => [
                    'otp' => $otp . ' Valid for one minute',
                ]
            ],200);
        }
    }

    public function managerLogin(Request $request)
    {
        // Validate input fields
        $validator = Validator::make($request->all(), [
            'country_code' => 'required|regex:/^\+\d{1,3}$/',
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
        $manager = User::where('country_code', $request->country_code)
        ->where('mobile_number', $request->number)
        ->first();
         
        if($manager->otp_verified == 0)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Please otp verify first',
            ], 200);
        }
         
        if (!$manager) {
            return response()->json([
                'status' => 0,
                'message' => 'Manager not found. Please check your number.',
            ], 200);
        }

        // Attempt to authenticate the user with the credentials
        if (Auth::attempt($credentials)) {
            $manager = Auth::user();
             
            // Delete existing tokens if any
            $manager->tokens()->delete();

            // Create a new token for the authenticated user
            $token = $manager->createToken('auth_token')->plainTextToken;

            // Log the user in
            Auth::login($manager);

            // Return success response with the generated token and user data
            return response()->json([
                'status' => 1,
                'message' => 'User logged in successfully',
                'api_token' => $token,
                'data' => [
                    'user' => $manager
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

    public function ManagerDashboard()
    {
        $user = Auth::user();
        $threeDaysFromNow = Carbon::today()->addDays(3)->format('Y-m-d');
        $sevenDaysFromNow = Carbon::today()->addDays(7)->format('Y-m-d');
        $expireIn24Hours = Carbon::now()->addHours(24)->format('Y-m-d H:i:s');

 
        $today = Carbon::today()->toDateString();
     
        
        $ActivePackage = DB::table('packages')->where('status', 1)
        ->where('center_id', $user->center_id)
        ->count();
        $InactivePackage = DB::table('packages')->where('status', 2)->where('center_id', $user->center_id)
        ->count();
        

        // Get users whose end_date is within the next three days (including today)
        $ExpireInThreeDays = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $threeDaysFromNow])
            ->count();

        // Get users whose end_date is within the next seven days (including today)
        $ExpireInSevenDays = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $sevenDaysFromNow])
            ->count();

        // Get users whose end_date is within the next 24 hours (including today)
        $ExpireInImmediate = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $expireIn24Hours])
            ->count();

        
        $PaymentReceived = DB::table('client_billings')
        ->where('center_id', $user->center_id)
        ->sum('amount');

        $PaymentPending = DB::table('client_billings')
        ->where('center_id', $user->center_id)
        ->sum('balance');

        $TotalPayments = $PaymentPending;

        $Pendding = $PaymentPending - $PaymentReceived;
 

        $MemberWithPackage = DB::table('users')
        ->where('center_id', $user->center_id)
        ->where('client_id', '!=', 0)
        ->where('end_date', null) 
        ->count();

        $MemberWithoutPackage = DB::table('users')
        ->where('center_id', $user->center_id)
        ->where('client_id', '!=', 0)
        ->where('end_date','!=', null) 
        ->count();


        $TotalGymMember = DB::table('users')
        ->where('center_id', $user->center_id)
        ->where('client_id', '!=', 0)
        // ->where('end_date','!=', null) 
        ->count();

        return response()->json([
            'status' => 1,
            'message' => 'Data get successfully', 
            'data' => [
                'active_package' => $ActivePackage,
                'inactive_package' => $InactivePackage,
                'exprire_in_three_days' => $ExpireInThreeDays,
                'expire_in_seven_days' => $ExpireInSevenDays,
                'expire_in_immediate' => $ExpireInImmediate,
                'payment_recevied' => $PaymentReceived,
                'payments_pendding' => $Pendding,
                'total_payment' => $TotalPayments,
                'member_with_packages' => $MemberWithPackage,
                'member_without_packages' => $MemberWithoutPackage,
                'total_gym_member' => $TotalGymMember
            ]
        ],200);
    } 

    public function GetManagerProfile(Request $request)
    {
        // Get the authenticated user (manager)
        $user = Auth::user(); 

        $threeDaysFromNow = Carbon::today()->addDays(3)->format('Y-m-d');
        $sevenDaysFromNow = Carbon::today()->addDays(7)->format('Y-m-d');
        $expireIn24Hours = Carbon::now()->addHours(24)->format('Y-m-d H:i:s');

        $today = Carbon::today()->toDateString();

        $ActivePackage = DB::table('packages')->where('status', 1)
            ->where('center_id', $user->center_id)
            ->count();
        $InactivePackage = DB::table('packages')->where('status', 2)
            ->where('center_id', $user->center_id)
            ->count();

        // Get users whose end_date is within the next three days (including today)
        $ExpireInThreeDays = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $threeDaysFromNow])
            ->count();

        // Get users whose end_date is within the next seven days (including today)
        $ExpireInSevenDays = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $sevenDaysFromNow])
            ->count();

        // Get users whose end_date is within the next 24 hours (including today)
        $ExpireInImmediate = DB::table('users')
            ->where('center_id', $user->center_id)
            ->whereBetween('end_date', [$today, $expireIn24Hours])
            ->count();

        $PaymentReceived = DB::table('client_billings')
            ->where('center_id', $user->center_id)
            ->sum('amount');

        $PaymentPending = DB::table('client_billings')
            ->where('center_id', $user->center_id)
            ->sum('balance');

        $TotalPayments = $PaymentPending;
        $Pendding = $PaymentPending - $PaymentReceived;

        $MemberWithPackage = DB::table('users')
            ->where('center_id', $user->center_id)
            ->where('client_id', '!=', 0)
            ->whereNull('end_date')
            ->count();

        $MemberWithoutPackage = DB::table('users')
            ->where('center_id', $user->center_id)
            ->where('client_id', '!=', 0)
            ->whereNotNull('end_date')
            ->count();

        $TotalGymMember = DB::table('users')
            ->where('center_id', $user->center_id)
            ->where('client_id', '!=', 0)
            ->count();

        // Fetch the center associated with the user
        $center = DB::table('centers')->where('id', $user->center_id)->first();

        // Check if the center exists
        if (!$center) {
            return response()->json([
                'status' => 0,
                'message' => 'Center not found for this manager',
                'data' => null
            ], 404);
        }

        // Ensure center has latitude and longitude fields
        // if (empty($center->latitude) || empty($center->longitude)) {
        //     return response()->json([
        //         'status' => 0,
        //         'message' => 'Center latitude or longitude is missing',
        //         'data' => null
        //     ], 400);
        // }

        // Fetch address from Google Maps API using latitude and longitude
        $apiKey = env('GOOGLE_MAPS_API_KEY'); // Store your API key in .env
        $response = \Http::get("https://maps.googleapis.com/maps/api/geocode/json", [
            'latlng' => $center->latitude . ',' . $center->longitude,
            'key' => $apiKey,
        ]);

        $data = $response->json();

        $address = null;
        if (!empty($data['results'])) {
            $address = $data['results'][0]['formatted_address'];
        }

        $center->center_address = $address; // Attach the resolved address
        // Fetch the shift(s) associated with the center
        $shifts = DB::table('shifts')->where('center_id', $center->id)->get();

        foreach ($shifts as $shift) {
            // 1: Male, 2: Female 3: Both  
            if ($shift->eligibility == 1) {
                $shift->eligibility = 'Male';
            } elseif ($shift->eligibility == 2) {
                $shift->eligibility = 'Female';
            } elseif ($shift->eligibility == 3) {
                $shift->eligibility = 'Both';
            }
        }
        // Assign shifts to center
        $center->shifts = $shifts;

        // Combine the manager (user) data with center and shifts into a single array
        $manager = [
            'id' => $user->id,
            'name' => $user->name,
            'surname' => $user->surname,
            'email' => $user->email,
            'country_code' => $user->country_code,
            'mobile_number' => $user->mobile_number,
            'otp' => $user->otp,
            'role' => $user->role,
            'center_id' => $user->center_id,
            'center_name' => $center->name,
            'gym_member_code' => $user->gym_member_code,
            'gender' => $user->gender,
            'image' => $user->image,
            'marital_status' => $user->marital_status,
            'date_of_birth' => $user->date_of_birth,
            'starting_date' => $user->starting_date,
            'end_date' => $user->end_date,
            'joining_date' => $user->joining_date,
            'description' => $user->description,
            'inquiry_mode' => $user->inquiry_mode,
            'status' => $user->status,
            'center' => $center, // Attach the center with its shifts
            
        ];

        // Return a success response with the combined data
        return response()->json([
            'status' => 1,
            'message' => 'Data retrieved successfully',
            'data' => [
                'active_package' => $ActivePackage,
                'inactive_package' => $InactivePackage,
                'expire_in_three_days' => $ExpireInThreeDays,
                'expire_in_seven_days' => $ExpireInSevenDays,
                'expire_in_immediate' => $ExpireInImmediate,
                'payment_received' => $PaymentReceived,
                'payments_pending' => $Pendding,
                'total_payment' => $TotalPayments,
                'member_with_packages' => $MemberWithPackage,
                'member_without_packages' => $MemberWithoutPackage,
                'total_gym_member' => $TotalGymMember,
                'users' => $manager
            ]
        ], 200);
    }
    
    
}
