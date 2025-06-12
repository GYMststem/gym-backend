<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\FingerHelper;
use App\Models\Attendance;
use DB;

class AttendanceController extends Controller
{
    public function sync()
    {
        $helper = new FingerHelper();
        // $zk = $helper->init('192.168.1.201'); // Change to your device IP
        $deviceIp = DB::table('finger_devices')->first();
         $zk = $helper->init($deviceIp->ip);

        if ($helper->syncAttendance($zk)) {
            return response()->json(['message' => 'Attendance synced successfully']);
        }

        return response()->json(['message' => 'Failed to connect to device'], 500);
    }

    public function show()
    {
        $attendances = Attendance::orderBy('timestamp', 'desc')->get();
        // return $attendances;
        return response()->json([
            'status' => 1,
            'message' => 'attendances retrieved successfully',
            'data' => [
                'attendances' => $attendances,
                
            ]
        ], 200);
        // return view('attendance', compact('attendances'));
    }


    public function voiceTest()
    {
        $helper = new FingerHelper();
        // $zk = $helper->init('192.168.1.201'); // Change to your ZKTeco IP
        $deviceIp = DB::table('finger_devices')->first();
        // dd($deviceIp);
         $zk = $helper->init($deviceIp->ip);

        if ($helper->playVoice($zk, 1)) {
            return response()->json(['message' => 'Voice test played successfully']);
        }

        return response()->json(['message' => 'Failed to play voice test'], 500);
    }
}
