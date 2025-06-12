<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Center;
use App\Models\Coupon;
use Validator;
use Illuminate\Support\Facades\Response;


class CouponController extends Controller
{
    //
    public function GetCoupon(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'api_key' => 'required| in:1'
        ]); 
         
        if ($validator->fails()) {
            return response()->json([
                'status' => 0,
                'message' =>  $request->api_key != 1 && $request->api_key != null ? 'The selected api key is invalid.' : 'The api key field is required.'
            ], 422);
        } 
         
        if($request->center_id)
        {
            $GetCoupon = Coupon::where('center_id',$request->center_id)->get();
             foreach($GetCoupon as $coupon)
            {
                $GetCenterName = Center::where('id',$coupon->center_id)->value('name');
                $coupon->center_name = $GetCenterName;
            }
            
            if(!$GetCoupon->isEmpty()) 
            return Response::json([
                'status' => 1,
                'message' => 'Get Coupon Successfully', 
                'data' => [
                    'coupon' => $GetCoupon
                ]
            ]);
            else
            return Response::json([
                'status' => 0,
                'message' => 'No Coupon Available', 
            ]);
        }else
        {
            

            $page = $request->page ?? 1; // Current page
            $limit = $request->items_per_page ?? 10; // Items per page 

            $GetCoupon = Coupon::paginate($limit, ['*'], 'page', $page);
            
             $GetCoupon = Coupon::paginate($limit, ['*'], 'page', $page);

            foreach($GetCoupon as $coupon)
            {
                $GetCenterName = Center::where('id',$coupon->center_id)->value('name');
                $coupon->center_name = $GetCenterName;
            }

            // Extract pagination data
            $pagination = [
                'current_page' => $GetCoupon->currentPage(),
                'first_page_url' => $GetCoupon->url(1),
                'from' => $GetCoupon->firstItem(),
                'last_page' => $GetCoupon->lastPage(),
                'last_page_url' => $GetCoupon->url($GetCoupon->lastPage()),
                'next_page_url' => $GetCoupon->nextPageUrl(),
                'path' => $GetCoupon->path(),
                'per_page' => $GetCoupon->perPage(),
                'prev_page_url' => $GetCoupon->previousPageUrl(),
                'to' => $GetCoupon->lastItem(),
                'total' => $GetCoupon->total(),
            ];

                if(!$GetCoupon->isEmpty()) 
                return Response::json([
                    'status' => 1,
                    'message' => 'Get Coupon Successfully', 
                    'data' => $GetCoupon->items(),
                    'payload' => [
                        'pagination' => $pagination
                    ]
                ]);
                else
                return Response::json([
                    'status' => 0,
                    'message' => 'No Coupon Available', 
                ]);
        }
       
    }

    public function AddUpdateCoupon(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'coupon_name' => 'required|string|max:255',
            'amount' => 'required|numeric|min:0',
            'percentage' => 'required|numeric|min:0|max:100',
            'center_id' => 'required|exists:centers,id',
            'coupon_start_date'  => 'required|date',
            'coupon_end_date' => 'required|date|after_or_equal:coupon_start_date',
            'status' => 'required|in:1,2',
            'comments' => 'nullable|string',
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

        $coupon = $request->id ? Coupon::findOrFail($request->center_id) : new Coupon;
        
        // Update or set the package attributes
        $coupon->coupon_name = $request->input('coupon_name');
        $coupon->amount = $request->input('amount');
        $coupon->percentage = $request->input('percentage');
        $coupon->center_id = $request->input('center_id');
        $coupon->coupon_start_date = $request->input('coupon_start_date');
        $coupon->coupon_end_date = $request->input('coupon_end_date');
        $coupon->status = $request->input('status');
        $coupon->comments = $request->input('comments');
    
        // Save the package
        $coupon->save();
    
        // Return a successful response
        return response()->json([
            'status' => 1,
            'message' => $request->id ? 'Update Coupon successfully' : 'Coupon saved successfully', 
            'data' => [
                'coupon' => $coupon
            ]
        ],200);
    }
}
