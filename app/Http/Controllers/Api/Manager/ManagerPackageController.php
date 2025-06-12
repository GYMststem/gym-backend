<?php

namespace App\Http\Controllers\Api\Manager;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Center;
use App\Models\User;
use App\Models\Package;
use App\Models\ApplyCoupon;
use Illuminate\Support\Facades\Response;
use Validator;
use DB;

class ManagerPackageController extends Controller
{
    //
    public function CreateUpdatePackage(Request $request)
    {
        // Define the validation rules
        $validator = Validator::make($request->all(), [
            'package_name' => 'required|string|max:255',
            'price' => 'required|numeric|gt:0',
            // 'center_id' => 'required|integer|exists:centers,id',
            'no_of_days' => 'required|integer|gt:0',
             'training_type' => 'required',
            'package_type' => 'required|in:1,2',
            // 'show_at_advicefit_platform' => 'nullable|boolean',
            // 'status' => 'required|in:1,2',
        ]);  
        
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = Auth::user();

        $CheckCenter = DB::table('centers')->where('user_id', $user->id)->first();
        // dd($CheckCenter->id);
        // Check if a package with the same name already exists
        $package = Package::where('package_name', $request->input('package_name'))
                        ->where('center_id', $CheckCenter->id)
                        ->first();
       
        if ($package) {
            // If a package exists and the $id is null or matches the existing package ID, update it
            if ($package->id) { 
                
                // Update the package  
                $package->package_name = $request->input('package_name');
                $package->center_id = $CheckCenter->id ?? $request->input('center_id');
                $package->price = $request->input('price');
                // $package->product_type = $request->input('product_type');
                $package->no_of_days = $request->input('no_of_days');
                $package->training_type = $request->input('training_type');
                // $package->package_timing = $request->input('package_timing');
                $package->package_type = $request->input('package_type');
                // $package->show_at_advicefit_platform = $request->input('show_at_advicefit_platform') ?? 0;
                $package->status = $request->input('status');
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
            $package->center_id = $CheckCenter->id ?? $request->input('center_id');;
            // $package->product_type = $request->input('product_type');
            $package->no_of_days = $request->input('no_of_days');
            $package->training_type = $request->input('training_type');
            // $package->package_timing = $request->input('package_timing');
            $package->package_type = $request->input('package_type');
            // $package->show_at_advicefit_platform = $request->input('show_at_advicefit_platform') ?? 0;
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

    public function GetPackageInfo(Request $request, $center_id,$package_id = null)
    { 
        // Check if package_id is provided; if so, prioritize it
        if ($package_id) {
            $CenterPackageGet = Package::where('id', $package_id)
            ->where('center_id',$center_id)->get(); 
        } 
        elseif($request->status)
        {
            $CenterPackageGet = Package::where('center_id',$center_id)
            ->where('status',$request->status) 
            ->get();
        } 
        else {
            // Get all packages for the center
            $CenterPackageGet = Package::where('center_id', $center_id)
            ->where('center_id',$center_id)->get();
        } 
        // If no package is found, return a not found message
        if ($CenterPackageGet->isEmpty()) {
            return response()->json([
                'status' => 0,
                'message' => 'Package not found',
            ]);
        }

        foreach ($CenterPackageGet as $packageGet) {
            // Get the center name
            $centerName = \DB::table('centers')->where('id', $packageGet->center_id)->first();
            $packageGet->center_name = $centerName->name ?? null;

            // Format the creation date
            $packageGet->c_date = \Carbon\Carbon::parse($packageGet->created_at)->format('Y-m-d H:i:s');

            // Map training type, package timing, and package type using associative arrays
            $trainingTypeMap = [
                1 => 'Male',
                2 => 'Female',
                3 => 'Both',
            ];
            $packageTimingMap = [
                1 => \Str::title('normal hours'),
                2 => \Str::title('sunny hours'),
            ];
            $packageTypeMap = [
                1 => \Str::title('main'),
                2 => \Str::title('add on'),
            ];

            
            // Assign the mapped values
            $packageGet->training_type = $trainingTypeMap[$packageGet->training_type] ?? null;
            $packageGet->package_timing = $packageTimingMap[$packageGet->package_timing] ?? null;
            $packageGet->package_type = $packageTypeMap[$packageGet->package_type] ?? null;
        }

        // Return the package data
        return response()->json([
            'status' => 1,
            'message' => 'Packages Get Successfully',
            'data' => $CenterPackageGet,
        ],200);
    }

    public function PackageDelete($package_id)
    {
        $CenterPackageDelete = Package::where('id', $package_id)->first();

        if(!$CenterPackageDelete)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Package not found',
            ],200);
        }else
        {
            $CenterPackageDelete->delete();
            return response()->json([
                'status' => 1,
                'message' => 'Package deleted successfully',
            ],200);
        } 
    }

}
