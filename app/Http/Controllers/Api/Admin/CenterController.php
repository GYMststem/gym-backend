<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Response;
use App\Models\Center;
use DB;


class CenterController extends Controller
{
    public function GetCenter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'api_key' => 'required|in:1',
        ]);
    
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' => $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.',
            ], 422);
        }
    
        $page = $request->page ?? 1; // Current page
        $limit = $request->items_per_page ?? 10; // Items per page
    
        // Fetch paginated centers
        $getCenters = Center::paginate($limit, ['*'], 'page', $page);
        foreach ($getCenters as $center) {
            $stateCityName = DB::table('cities')->where('cities.id',$center->city_id)
            ->join('states','states.id','cities.state_id')
            ->select('cities.name as city_name','states.name')
            ->first(); 
            $center->state_name = $stateCityName->name;
            $center->city_name = $stateCityName->city_name;
        }
        if ($getCenters->isEmpty()) {
            return response()->json([
                'status' => 0,
                'message' => 'No Center Available.',
            ]);
        }
    
        // Extract pagination data
        $pagination = [
            'current_page' => $getCenters->currentPage(),
            'first_page_url' => $getCenters->url(1),
            'from' => $getCenters->firstItem(),
            'last_page' => $getCenters->lastPage(),
            'last_page_url' => $getCenters->url($getCenters->lastPage()),
            'next_page_url' => $getCenters->nextPageUrl(),
            'path' => $getCenters->path(),
            'per_page' => $getCenters->perPage(),
            'prev_page_url' => $getCenters->previousPageUrl(),
            'to' => $getCenters->lastItem(),
            'total' => $getCenters->total(),
        ];
     
    
        return response()->json([
            'status' => 1,
            'message' => 'Get Center Successfully',
            'data' => $getCenters->items(), // Send only the items
            'payload' => [
                'pagination' => $pagination, 
            ]
        ]);
    }

    public function CreateCenter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'address_line_1' => 'required',
            'address_line_2' => 'required',
            'city_id' => 'required',
            'state_id'  => 'required',
            'pincode' => 'required', 
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

        $CreateCenter = new Center();
        $CreateCenter->name  = $request->name;
        $CreateCenter->address_line_1  = $request->address_line_1;
        $CreateCenter->address_line_2  = $request->address_line_2;
        $CreateCenter->city_id  = $request->city_id;
        $CreateCenter->state_id  = $request->state_id;
        $CreateCenter->pincode  = $request->pincode; 
 
        $CreateCenter->save();

        if($CreateCenter) 
        return Response::json([
            'status' => 1,
            'message' => 'Center Created Successfully', 
            'data' => [
                'Center' => $CreateCenter
            ]
        ], 200);
        else
        return Response::json([
            'status' => 0,
            'message' => 'No Center Created', 
        ]);
 
    }

    public function updateCenter(Request $request)
    {
        $validator = Validator::make($request->all(), [
            // 'id' => 'required|exists:centers,id', // Ensure the center ID exists in the centers table
            'name' => 'required',
            'address_line_1' => 'required',
            'address_line_2' => 'required',
            'city_id' => 'required',
            'state_id' => 'required',
            'pincode' => 'required',
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

        // Find the center by ID
        $center = Center::find($request->id);

        if (!$center) {
            return Response::json([
                'status' => 0,
                'message' => 'Center not found',
            ]);
        }

        // Update center fields
        $center->name = $request->name;
        $center->address_line_1 = $request->address_line_1;
        $center->address_line_2 = $request->address_line_2;
        $center->city_id = $request->city_id;
        $center->state_id = $request->state_id;
        $center->pincode = $request->pincode;

        // Save the updated center
        $center->save();

        return Response::json([
            'status' => 1,
            'message' => 'Center updated successfully',
            'data' => [
                'center' => $center, // Optionally return the updated center data
            ],
        ]);
    }
}
