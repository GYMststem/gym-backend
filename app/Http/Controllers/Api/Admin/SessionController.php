<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Center;
use App\Models\Session;
use Validator;
use Illuminate\Support\Facades\Response;

class SessionController extends Controller
{
    //
    public function GetSession(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'center_id' => 'required', 
            'api_key' => 'required| in:1'
        ]);
  
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
            ], 422);
        } 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        if($request->center_id)
        {
            $GetSession = Session::where('center_id',$request->center_id)->get();
            if(!$GetSession->isEmpty()) 
            return Response::json([
                'status' => 1,
                'message' => 'Session Get Successfully', 
                'data' => [
                    'coupon' => $GetSession
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Session Available', 
            ]);
        }else
        {
             
            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page 

            $GetSession = Session::paginate($limit, ['*'], 'page', $page);

            // Extract pagination data
            $pagination = [
                'current_page' => $GetSession->currentPage(),
                'first_page_url' => $GetSession->url(1),
                'from' => $GetSession->firstItem(),
                'last_page' => $GetSession->lastPage(),
                'last_page_url' => $GetSession->url($GetSession->lastPage()),
                'next_page_url' => $GetSession->nextPageUrl(),
                'path' => $GetSession->path(),
                'per_page' => $GetSession->perPage(),
                'prev_page_url' => $GetSession->previousPageUrl(),
                'to' => $GetSession->lastItem(),
                'total' => $GetSession->total(),
            ];
                if(!$GetSession->isEmpty()) 
                return Response::json([
                    'status' => 1,
                    'message' => 'Session Get Successfully', 
                    'data' => $GetSession->items(),
                    'payload' => [
                        'pagination' => $pagination
                    ]
                ]);
                else
                return Response::json([
                    'status' => 0,
                    'message' => 'No Session Available', 
                ]);
        }
    }


    public function AddUpdateSession(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'center_id' => 'required|integer|exists:centers,id',
            'session_date' => 'required|date|after_or_equal:today',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
            'number_of_member_capacity' => 'required|integer|min:1',
            'status' => 'required|in:1,2',  // '1 active, 2 inactive'
            'api_key' => 'required| in:1'
        ]);
 
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
            ], 422);
        } 

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
 
        // Retrieve package by ID if exists, or create a new instance
        $SaveSession = $request->id ? Session::findOrFail($request->id) : new Session;
        
        // Update or set the package attributes
        $SaveSession->title = $request->input('title'); 
        $SaveSession->center_id = $request->input('center_id');
        $SaveSession->session_date = $request->input('session_date');
        $SaveSession->start_time = $request->input('start_time');
        $SaveSession->end_time = $request->input('end_time');
        $SaveSession->number_of_member_capacity = $request->input('number_of_member_capacity'); 
        $SaveSession->status = $request->input('status');
    
        // Save the package
        $SaveSession->save();


        // Return a successful response
        return response()->json([
            'status' => 1,
            'message' => $request->id ? 'Update Session Successfully' : 'Session Created Successfully', 
            'data' => [
                'session' => $SaveSession
            ]
        ],200);

    }

}
