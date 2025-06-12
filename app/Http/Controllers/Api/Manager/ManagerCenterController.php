<?php

namespace App\Http\Controllers\Api\Manager;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Center;
use App\Models\User;
use Validator;
use DB;
use Auth;


class ManagerCenterController extends Controller
{    
    public function ManagerCreateCenter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string', // Ensure the center name is required
            'shifts' => 'required|array',
            'shifts.*.shift_name' => 'required|string',
            'shifts.*.start_time' => 'required|date_format:H:i',
            'shifts.*.end_time' => 'required|date_format:H:i|after:shifts.*.start_time',
            'shifts.*.eligibility' => 'required|in:1,2,3',
            'surname' => 'required|string',
        ]);
         
        
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()], 422);
        } 
        DB::beginTransaction();

        try {
            $user = Auth::user();

            User::where('id', $user->id)->update([
                'name' => $request->user_name,
                'surname' => $request->surname, 
            ]);
            
            // Create or update the center
            $CreateCenter = Center::updateOrCreate(
                ['name' => $request->name], // Search criteria
                [
                    'address_line_1' => $request->address_line_1 ?? null,
                    'address_line_2' => $request->address_line_2 ?? null,
                    'city_id' => $request->city_id ?? null,
                    'state_id' => $request->state_id ?? null,
                    'pincode' => $request->pincode ?? null,
                    'user_id' => $user->id
                ]
            );

            // Update the user's center_id
             // Manually update the user's center_id
            $user->center_id = $CreateCenter->id;
            $user->save();
            // Handle shifts
            $shiftDetails = []; // Array to hold shift details
            $existingShifts = []; // To hold shift names that already exist

            foreach ($request->shifts as $shift) {
                // Check if the shift with the same name already exists for the center
                $existingShift = DB::table('shifts')
                    ->where('shift_name', $shift['shift_name'])
                    ->where('center_id', $CreateCenter->id)
                    ->first();
                    
                $startTime = strtotime($shift['start_time']);
                $endTime = strtotime($shift['end_time']);

                if (($endTime - $startTime) < 1800) { // 1800 seconds = 30 minutes
                    return response()->json([
                            'status' => 0,
                            'error' => 'The end time must be at least 30 minutes after the start time.'
                        ], 422);
                }

                if (!$existingShift) {
                    // Insert the new shift if it doesn't already exist
                    $shiftId = DB::table('shifts')->insertGetId([
                        'shift_name' => $shift['shift_name'],
                        'start_time' => $shift['start_time'],
                        'end_time' => $shift['end_time'],
                        'center_id' => $CreateCenter->id, 
                        'eligibility' => $shift['eligibility'],
                    ]);

                    // Retrieve and add the shift details to the array
                    $shiftDetails[] = DB::table('shifts')->where('id', $shiftId)->first();
                } else {
                    
                    // return response()->json([
                    //     'status' => 0,
                    //     'message' => 'Name already exists',
                    // ]);
                    // If the shift already exists, add it to the existing shifts array
                   $existingShifts[] = $shift['shift_name'];
                }
            }

            // Commit the transaction if everything is successful
            DB::commit();

            // Prepare response message
            $responseMessage = 'Center created successfully';
            if (!empty($existingShifts)) {
                $responseMessage .= ', and these shifts already exist:' . implode(', ', $existingShifts);
            }

            return response()->json([
                'status' => 1,
                'message' => $responseMessage,
                'data' => [
                    'Center' => [
                        'id' => $CreateCenter->id,
                        'user_id' => $user->id,
                        'name' => $CreateCenter->name,
                        'address_line_1' => $CreateCenter->address_line_1,
                        'address_line_2' => $CreateCenter->address_line_2,
                        'city_id' => $CreateCenter->city_id,
                        'state_id' => $CreateCenter->state_id,
                        'pincode' => $CreateCenter->pincode,
                        'shifts' => $shiftDetails, // Include shifts in the response
                        'created_at' => $CreateCenter->created_at,
                        'updated_at' => $CreateCenter->updated_at
                    ]
                ]
            ], 200);

        } catch (\Exception $e) {
            // Rollback the transaction if something went wrong
            DB::rollback();

            return response()->json([
                'status' => 0,
                'message' => 'No Center Created',
                'error' => $e->getMessage() // Include the exception message for debugging
            ], 500);
        }
    }


    public function AddAddress(Request $request, $center_id)
    { 
        if($request->latitude == null || $request->longitude == null)
        {
            $validator = Validator::make($request->all(), [
                'address_line_1' => 'required',
                'address_line_2' => 'required',
                'city_id' => 'required',
                'state_id' => 'required',
                'pincode' => 'required',
                'latitude'    => 'nullable|numeric|between:-90,90',
                'longitude'   => 'nullable|numeric|between:-180,180', 
            ]);
        }
        else
        {
            $validator = Validator::make($request->all(), [ 
                'latitude'    => 'nullable|numeric|between:-90,90',
                'longitude'   => 'nullable|numeric|between:-180,180', 
            ]);
        }
         

        // If validation fails, return the errors
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'errors' => $validator->errors()
            ], 422);
        }
 
        $CreateID = Center::where('id',$center_id)->first();

        if (!$CreateID)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid center id'
            ], 200);
        }

        $user = Auth::user();
 
        // Create or update the center
        $CreateCenter = Center::where('id',$center_id)->update([
                'address_line_1' => $request->address_line_1 ?? null,
                'address_line_2' => $request->address_line_2 ?? null,
                'city_id' => $request->city_id ?? null,
                'state_id' => $request->state_id ?? null,
                'pincode' => $request->zipcode ?? null,
                'latitude' => $request->latitude ?? null,
                'longitude' => $request->longitude ?? null, 
        ]);


        return response()->json([
            'status' => 1,
            'message' => 'Address Added successfully',
        ]);
    }
}
