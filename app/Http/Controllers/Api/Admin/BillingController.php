<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use App\Models\User;
use App\Models\Package;
use App\Models\MembersPlans;
use Carbon\Carbon;
use App\Models\ApplyCoupon;
use App\Models\Coupon;
use Auth;
use App\Models\Subscription; 

class BillingController extends Controller
{
    //

     public function GetMemberBilling($member_id = null)
    {
        $total_debit = 0;
        $total_credit = 0;
        $billingDetails = []; 
        // If a member ID is provided, get the billing details for that specific member
        if ($member_id) {
            $GetMemberBill = DB::table('client_billings')
                ->where('user_id', $member_id)
                ->get();

            if ($GetMemberBill->isEmpty()) {

                $clientDetaile = User::where('id',$member_id)->first();
                return response()->json([
                    'status' => 0,
                    'message' => 'User data not exist',
                     'data' => [
                        'user_id' => $clientDetaile->id,
                        'client_id' => $clientDetaile->client_id,
                        'client_name' => $clientDetaile->name,
                        'surname' => $clientDetaile->surname,
                        'total_debit' => 0,
                        'total_credit' => 0,
                        'remaining_balance' => 0,
                        'records' => []
                    ]
                ], 200);
            }

            foreach ($GetMemberBill as $bill) {

               
                $clientDetaile = User::where('id',$bill->user_id)->first();
                  
               $userID = $clientDetaile->id;
                $clientID = $bill->client_id;
                $clientName = $clientDetaile->name;
                $surname = $clientDetaile->surname;

                $debit = $bill->amount;
                $credit = $bill->balance;
                $bill->pay_remaining_balance = $bill->balance - $bill->amount;
                 $client_billing_history = array();
                 $billingHistiories = DB::table('client_billing_payment_histories')->where('client_billing_id',$bill->id)->get();
                 foreach ($billingHistiories as $billingHistiory) {
                     $client_billing_history[] = $billingHistiory;
                 }
                 $bill->payment_history =$client_billing_history;

                // Add to total debit and credit
                $total_debit += $debit;
                $total_credit += $credit;  
                $remaining_balance = $total_credit - $total_debit;

                $bill->c_date = Carbon::parse($bill->created_at)->format('Y-m-d H:i:s');

            }

            return response()->json([
                'status' => 1,
                'message' => 'Member billing details retrieved successfully',
                'data' => [
                    'user_id' => $clientDetaile->id,
                    'client_id' => $clientID,
                    'client_name' => $clientName,
                    'surname' => $surname,
                    'total_debit' => $total_debit,
                    'total_credit' => $total_credit,
                    'remaining_balance' => $remaining_balance,
                    'remaining_days' => 90,
                    'records' => $GetMemberBill
                ]
            ], 200);
        }

        // If no member ID is provided, get the billing details for all users
        $AllMemberBills = DB::table('client_billings')->get();

        foreach ($AllMemberBills as $bill) { 

            $clientDetaile = User::where('id',$bill->user_id)->first();
            
            $clientID = $bill->client_id;
            $clientName = $clientDetaile->name;
            $surname = $clientDetaile->surname; 

            $debit = $bill->amount;
            $credit = $bill->balance;

            // Add to total debit and credit
            $total_debit += $debit;
            $total_credit += $credit;
            $remaining_balance = $total_credit - $total_debit;
            
            $bill->c_date = Carbon::parse($bill->created_at)->format('Y-m-d H:i:s');

            
            
        }

        return response()->json([
            'status' => 1,
            'message' => 'All member billing details retrieved successfully',
            'data' => [
                    'user_id' => $clientDetaile->id,
                    'client_id' => $clientID,
                    'client_name' => $clientName,
                    'surname' => $surname,
                    'total_debit' => $total_debit,
                    'total_credit' => $total_credit,
                    'remaining_balance' => $remaining_balance,
                    'records' => $AllMemberBills
                ]
        ], 200);
    }

 
    public function memberBillingPaymentHistory(Request $request){
        $billingPaymentHistory = DB::table('client_billings')->where('id',$request->billingId)->first();
        if(!empty($billingPaymentHistory)){
            $totalPayedAmount =$billingPaymentHistory->amount + $request->paidAmount;
            $totalRemaningAmount =($billingPaymentHistory->balance - $billingPaymentHistory->amount) - $request->paidAmount;
            $updateClientData =array(
                'amount' =>$totalPayedAmount,
                );
                DB::table('client_billings')->where('id',$request->billingId)->update($updateClientData);
                $createClientBillingHistory = array(
                    'amount' => $request->amount,
                    'balance' => $request->balance,
                    'payedAmount' => $request->paidAmount,
                    'remaining_balance' => $totalRemaningAmount,
                    'client_billing_id' =>$request->billingId,
                    'created_at' => date('Y-m-d H:i:s'),
                    );
                    DB::table('client_billing_payment_histories')->insert($createClientBillingHistory);
                    
                    return response()->json([
                'status' => 1,
                'message' => 'Member billing details Updated successfully',
                'data' => [
                ]
            ], 200);
            
            
        }else{
            return response()->json([
                'status' => 0,
                'message' => 'Member billing details not found',
                'data' => [
                ]
            ], 200);
            
        }
    }


     public function CreateMemberBilling(Request $request,$member_id)
    {
        // Define validation rules
        // $validator = Validator::make($request->all(), [
        //     'user_id' => 'required|integer|exists:users,id',
        //     'client_id' => 'required|integer|exists:clients,id',
        //     'transaction_type' => 'required|string|max:50',
        //     'monthly_fee' => 'required|numeric|min:0',
        //     'discount' => 'nullable|numeric|min:0',
        //     'no_of_moths' => 'required|integer|min:1',
        //     'start_date' => 'required|date',
        //     'receipt_method' => 'required|string|max:50',
        //     'balance' => 'required|numeric|min:0',
        //     'amount' => 'required|numeric|min:0',
        //     'reference' => 'nullable|string|max:255',
        //     'description' => 'nullable|string|max:1000',
        // ]);

        // // Check if validation fails
        // if ($validator->fails()) {
        //     return response()->json(['errors' => $validator->errors()], 422);
        // }

        $userExist = User::where('id', $member_id)->first();

        if (!$userExist) {
            return response()->json([
                'status' => 0,
                'message' => 'User does not exist',
            ], 404);
        } 

        
        if($request->apply_coupon_id)
                {
                    
                    $coupon =  Coupon::where('id',$request->apply_coupon_id)->first();
 
                    $package = Package::where('id',$request->package_id)->first(); 

                    $discountAmount = $package != null ? ($package->price * $coupon->percentage) / 100 : null; 

                    // dd($discountAmount);
                        
                    $finalPrice = $package != null ? $package->price - $discountAmount : null;  

                    $payble_amount = $finalPrice;  
                    
                    if ($package) {
                        // Use Carbon::parse to parse the start date from the request
                        $startDate = Carbon::parse($request->input('start_date'));
                    
                        // Add the number of days from the package to the start date
                        $endDate = $startDate->addDays($package->no_of_days)->format('Y-m-d'); 
                         
                    }  
                    $data = [
                        'user_id' => $member_id,
                        'client_id' => $request->input('client_id') ?? null,
                        'transaction_type' => $request->input('transaction_type') ?? null,
                        'package_id' => $request->package_id,
                        'monthly_fee' => $request->input('monthly_fee') ?? null,
                        'discount' => $discountAmount ?? 0,
                        'no_of_moths' => $request->input('no_of_moths') ?? null,
                        'start_date' => $request->input('start_date') ?? null,
                        'end_date' =>$request->end_date ?? isset($endDate) ? $endDate : null,
                        'receipt_method' => $request->input('receipt_method') ?? null ,
                        'balance' => $finalPrice ?? 0,
                        'amount' => $request->paid_amount ?? 0,
                        'reference' => $request->input('reference') ?? null,
                        'description' => $request->input('description') ?? null,
                        'created_by' => Auth::user()->id ?? 1,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
            
                    // Insert data into the client_billings table
                    $inserted = DB::table('client_billings')->insertGetId($data); 
                    // dd($inserted);
                    $ApplyCoupon = ApplyCoupon::create([
                        'user_id' => $member_id,
                        'package_id' => $request->package_id,
                        'discount_price' => $discountAmount,
                        'final_price' => $finalPrice,
                        'paid_amount' => $request->paid_amount,
                        'coupon_id' => $request->apply_coupon_id,
                        'billing_id' => $inserted,
                        'applied_at' => Carbon::now(), 
                    ]);

                    

                    $user = User::where('id',$member_id)->update([ 
                        'starting_date' => $request->input('start_date'),
                        'end_date' =>$request->end_date ?? isset($endDate) ? $endDate : null,
                        'client_id' => $request->input('client_id') ?? 0, 
                    ]);

                    
            
                } 
                else
                {  
                    $package = DB::table('packages')
                    ->where('id',$request->package_id)->first(); 
                    
                    if ($package) {
                        // Use Carbon::parse to parse the start date from the request
                        $startDate = Carbon::parse($request->input('start_date'));
                    
                        // Add the number of days from the package to the start date
                        $endDate = $startDate->addDays($package->no_of_days)->format('Y-m-d'); 
                         
                    }
                    
                    if($package->type == 2 || $package->type == 1)
                    {
                        $lastSubID = DB::table('subscriptions') 
                        ->orderBy('daily_sub_id', 'desc') // Order by `daily_sub_id` in descending order
                        ->value('daily_sub_id');  

                        $addClientSub = new Subscription;
                        $addClientSub->name = $userExist->name;
                        $addClientSub->daily_sub_id = $lastSubID == null ? 10000 + 1 : $lastSubID + 1;
                        $addClientSub->surname = $userExist->surname;
                        $addClientSub->email = $userExist->email;
                        $addClientSub->package_id = $request->package_id;
                        $addClientSub->mobile = $userExist->mobile;
                        $addClientSub->gender = $userExist->gender;
                        $addClientSub->date = Carbon::now()->format('Y-m-d');
                        $addClientSub->paid_amount = $request->paid_amount;
                        $addClientSub->payable_amount = $request->payable_amount; 
                        $addClientSub->remark = $request->input('description');  
                        $addClientSub->type =$package->type; 
                        $addClientSub->created_by = Auth::user()->id ?? 1;
                        $addClientSub->save();
                    }
                     
                    $data = [
                        'user_id' => $member_id,
                        'client_id' => $request->input('client_id') ?? null,
                        'transaction_type' => $request->input('transaction_type') ?? null,
                        'package_id' => $request->package_id,
                        'monthly_fee' => $request->input('monthly_fee') ?? null,
                        'discount' => $request->input('discount') ?? 0,
                        'no_of_moths' => $request->input('no_of_moths') ?? null,
                        'start_date' => $request->input('start_date') ?? null,
                        'end_date' => $request->end_date ?? isset($endDate) ? $endDate : null,
                        'receipt_method' => $request->input('receipt_method') ?? null ,
                        'balance' => $request->payable_amount ?? 0,
                        'amount' => $request->paid_amount ?? 0,
                        'reference' => $request->input('reference') ?? null,
                        'description' => $request->input('description') ?? null,
                        'created_by' => Auth::user()->id ?? 1,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
            
                    // Insert data into the client_billings table
                    $inserted = DB::table('client_billings')->insert($data);
                }   

                if($package)
                {
                    $endDate = Carbon::now()->addDays($package->no_of_days)->format('Y-m-d') ?? null;
                }

                $user = User::where('id',$member_id)->update([ 
                    'starting_date' => $request->input('start_date'),
                    'end_date' =>$request->end_date ?? isset($endDate) ? $endDate : null,
                    'client_id' => $request->input('client_id') ?? 0, 
                ]);
 

                
                    $memberPackage = Package::where('id',$request->package_id)->first();
                    
                    if($request->date_from && $request->date_to)
                    {
                        $dateFrom = Carbon::parse($request->date_from);
                        $dateTo = Carbon::parse($request->date_to);
                        $noOfDays = $dateFrom->diffInDays($dateTo); 
                    } 

                    $membersPlan = new MembersPlans();
                    $membersPlan->user_id = $member_id;
                    $membersPlan->package_id = $request->package_id ?? 0;
                    $membersPlan->package_name = $memberPackage->package_name ?? null;
                    $membersPlan->price = $memberPackage->price ?? $request->manual_price;
                    $membersPlan->center_id = $request->center_id ?? 1;
                    $membersPlan->no_of_days = $memberPackage->no_of_days ?? null;
                    $membersPlan->type = $memberPackage->type ?? 0;
                    $membersPlan->product_type = $memberPackage->product_type ?? $request->product_type;
                    $membersPlan->training_type = $memberPackage->training_type ?? $request->training_type;
                    $membersPlan->package_timing = $memberPackage->package_timing ?? $request->package_timing;
                    $membersPlan->package_type = $memberPackage->package_type ?? $request->package_type;
                    $membersPlan->show_at_advicefit_platform = $memberPackage->show_at_advicefit_platform ?? $request->show_at_advicefit_platform;
                    $membersPlan->status = $memberPackage->status ?? $request->packge_status;
                    $membersPlan->date_from = $request->input('start_date') ?? $memberPackage->date_from ?? null;
                    $membersPlan->date_to = $request->input('end_date') ?? $memberPackage->date_to ?? null;
                    $membersPlan->manual_price = $request->manual_price ?? $memberPackage->manual_price ?? null;
                    $membersPlan->membership_type = $memberPackage->membership_type ?? 0;
                    $membersPlan->assigned_users_id = $request->trainer_id ?? 2;
                     
                    $membersPlan->save(); 
                    
                // Prepare data for insertion
        //         $data = [
        //             'user_id' => $member_id,
        //             'client_id' => $request->input('client_id'),
        //             'transaction_type' => $request->input('transaction_type'),
        //             'monthly_fee' => $request->input('monthly_fee'),
        //             'discount' => $request->input('discount') ?? 0,
        //             'no_of_moths' => $request->input('no_of_moths'),
        //             'start_date' => $request->input('start_date'),
        //             'receipt_method' => $request->input('receipt_method'),
        //             'balance' => $request->input('balance'),
        //             'amount' => $request->input('amount'),
        //             'reference' => $request->input('reference') ?? null,
        //             'description' => $request->input('description') ?? null,
        //             'created_at' => now(),
        //             'updated_at' => now(),
        //         ];

        // // Insert data into the client_billings table
        // $inserted = DB::table('client_billings')->insert($data);

        // Check if the insertion was successful
        if ($inserted) {
            return response()->json([
                'status' => 1,
                'message' => 'Billing record created successfully',
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'status' => 0,
                'message' => 'Failed to create billing record',
            ], 500);
        }
    }

    
     public function DeleteMemberBilling($billing_id)
    {
        $billing = DB::table('client_billings')->where('id', $billing_id)->first(); 

        if(!$billing)
        {
            return response()->json([
                'status' => 0,
                'message' => 'Billing id not found',  
            ],404);
        }
        else
        { 
            DB::table('users')->where('id',$billing->user_id)->update([
                'starting_date' => null,
                'end_date' => null
            ]);
            DB::table('client_billings')->where('id', $billing_id)->delete();
             DB::table('members_plans')->where('user_id', $billing->user_id)->delete();

            return response()->json([
                'status' => 1,
                'message' => 'Billing deleted successfully',  
            ],200);

        }
    }
    
      public function GetMnthlyCashReport(Request $request, $filter = null)
    {
        // Initialize variables
        $billingReports = null;
        $monthlyReport = [];
        $totalCredit = 0;
        $totalDebit = 0;
        $remaining_balance = 0;
        $currentMonth = Carbon::now()->format('m');

        $startDate = $request->get('start_date');
        $endDate = $request->get('end_date');

        if ($request->start_date && $request->end_date) {

            if ($request->start_date > $request->end_date) {
                return response()->json([
                    'status' => 0,
                    'message' => 'Start date must be greater than or equal to ' . $request->start_date,
                ]);
            }

            // Billing Reports
            $billingReports = DB::table('client_billings')
                ->select('package_id', 
                    DB::raw('COUNT(*) as package_count'),
                    DB::raw('SUM(balance) as total_credit'), 
                    DB::raw('SUM(amount) as total_debit'))
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                ->whereNotNull('package_id')
                ->groupBy('package_id')
                ->get();

            // Spa Daily Report for Type 1
            $spa_type_2 = DB::table('subscriptions')
                ->select('package_id', 
                    DB::raw('COUNT(*) as package_count'),
                    DB::raw('SUM(payable_amount) as total_credit'), 
                    DB::raw('SUM(paid_amount) as total_debit'))
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                ->whereNotNull('package_id') 
                ->whereNull('deleted_at')
                ->where('type', 2) // Fetch for type 1
                ->groupBy('package_id')
                ->get();

           

            // Spa Daily Report for Type 2
            $spa_type_1 = DB::table('subscriptions')
                ->select('package_id', 
                    DB::raw('COUNT(*) as package_count'),
                    DB::raw('SUM(payable_amount) as total_credit'), 
                    DB::raw('SUM(paid_amount) as total_debit'))
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                ->whereNotNull('package_id') 
                ->whereNull('deleted_at')
                ->where('type', 1) // Fetch for type 2
                ->groupBy('package_id')
                ->get();

            // Merging billing reports, spa_type_1, and spa_type_2 data
            $combinedReports = [];

            // Merge billing reports into combinedReports
            foreach ($billingReports as $report) {
                $combinedReports[$report->package_id] = [
                    'package_id' => $report->package_id,
                    'package_count' => $report->package_count,
                    'total_credit' => $report->total_credit,
                    'total_debit' => $report->total_debit,
                ];
            }
            
            $billingReportAfterPayments = DB::table('client_billing_payment_histories')
               ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                ->get();
                // return $billingReportAfterPayments;
                foreach ($billingReportAfterPayments as  $billingReportAfterPayment) {
                    $billingAferPaymentData = DB::table('client_billings')
                    ->select('package_id',
                        DB::raw('COUNT(*) as package_count'),
                        DB::raw('SUM(balance) as total_credit'), 
                        DB::raw('SUM(amount) as total_debit'))
                    ->whereNotNull('package_id')
                    ->where('id', $billingReportAfterPayment->client_billing_id)
                    ->groupBy('package_id') // Add this line
                    ->first();
                    if (!empty($billingAferPaymentData)) {
                        // $combinedReports[$billingAferPaymentData->package_id] = [
                        //     'package_id' => $billingAferPaymentData->package_id,
                        //     'package_count' => $billingAferPaymentData->package_count,
                        //     'total_credit' => $billingAferPaymentData->total_credit,
                        //     'total_debit' => $billingReportAfterPayment->payedAmount,
                        // ];
                        
                        
                        if (isset($combinedReports[$billingAferPaymentData->package_id])) {
                                // If exists, update the existing entry
                                // $combinedReports[$billingAferPaymentData->package_id]['package_count'] += $billingAferPaymentData->package_count;
                                $combinedReports[$billingAferPaymentData->package_id]['total_credit'] += $billingAferPaymentData->total_credit;
                                $combinedReports[$billingAferPaymentData->package_id]['total_debit'] += $billingReportAfterPayment->payedAmount;
                            } else {
                                // If not exists, create a new entry
                                $combinedReports[$billingAferPaymentData->package_id] = [
                                    'package_id' => $billingAferPaymentData->package_id,
                                    'package_count' => $billingAferPaymentData->package_count,
                                    'total_credit' => $billingAferPaymentData->total_credit,
                                    'total_debit' => $billingReportAfterPayment->payedAmount,
                                ];
                            }
                    }
                    
                }

            // Merge spa_type_1 data into combinedReports
            foreach ($spa_type_1 as $spa) { 
                if (isset($combinedReports[$spa->package_id])) {
                    $dailyCount =  DB::table('subscriptions')
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                    ->where('type', 1) 
                    ->count();
                    $combinedReports[$spa->package_id]['package_count'] = $dailyCount;
                    $combinedReports[$spa->package_id]['total_credit'] += $spa->total_credit;
                    $combinedReports[$spa->package_id]['total_debit'] += $spa->total_debit;
                } else {
                    $dailyCount =  DB::table('subscriptions')
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                    ->where('type', 1) 
                    ->count();
                    $combinedReports[$spa->package_id] = [
                        'package_id' => $spa->package_id,
                        'package_count' => $dailyCount,
                        'total_credit' => $spa->total_credit,
                        'total_debit' => $spa->total_debit,
                    ];
                }
            }

            // Merge spa_type_2 data into combinedReports
            foreach ($spa_type_2 as $spa) {
                  
                
                if (isset($combinedReports[$spa->package_id])) { 
                    $SPACount =  DB::table('subscriptions')
                    ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                        ->where('type', 2) 
                        ->count();
                    $combinedReports[$spa->package_id]['package_count'] = $SPACount;
                    $combinedReports[$spa->package_id]['total_credit'] += $spa->total_credit;
                    $combinedReports[$spa->package_id]['total_debit'] += $spa->total_debit;
                } else {
                    $SPACount =  DB::table('subscriptions')
                    ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                        ->where('type', 2) 
                        ->count();
                    $combinedReports[$spa->package_id] = [
                        'package_id' => $spa->package_id,
                        'package_count' => $SPACount,
                        'total_credit' => $spa->total_credit,
                        'total_debit' => $spa->total_debit,
                    ];
                }
            }
            
            // Spa Daily Report for Type 0
        $spa_type_0 = DB::table('subscriptions')
            ->select('package_id', 
                DB::raw('COUNT(*) as package_count'),
                DB::raw('SUM(payable_amount) as total_credit'), 
                DB::raw('SUM(paid_amount) as total_debit'))
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
            ->whereNotNull('package_id') 
            ->whereNull('deleted_at')
            ->where('type', 0) // Fetch for type 0
            ->groupBy('package_id')
            ->get();
        
        // Merge spa_type_0 data into combinedReports
        foreach ($spa_type_0 as $spa) {
            $SPA0Count = DB::table('subscriptions')
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
                ->whereNull('deleted_at')
                ->where('type', 0)
                ->count();
        
            if (isset($combinedReports[$spa->package_id])) {
                $combinedReports[$spa->package_id]['package_count'] += $SPA0Count;
                $combinedReports[$spa->package_id]['total_credit'] += $spa->total_credit;
                $combinedReports[$spa->package_id]['total_debit'] += $spa->total_debit;
            } else {
                $combinedReports[$spa->package_id] = [
                    'package_id' => $spa->package_id,
                    'package_count' => $SPA0Count,
                    'total_credit' => $spa->total_credit,
                    'total_debit' => $spa->total_debit,
                ];
            }
        }

            
            
            $totCount = 0;

            // Prepare the final monthly report with combined data
            foreach ($combinedReports as $report) {
                
                $remaining_balance = $report['total_credit'] - $report['total_debit'];

                $package = DB::table('packages')->where('id', $report['package_id'])->first();
                
                $totCount = $totCount + $report['package_count'];
                 
                $monthlyReport[] = [
                    'package_id' => $report['package_id'],
                    'package_name' => $package->package_name ?? 'Unknown', 
                    'count' => $report['package_count'],
                    'total_credit' => $report['total_credit'],
                    'total_debit' => $report['total_debit'],
                    'remaining_balance' => $remaining_balance,
                ];

                $totalCredit += $report['total_credit'];
                $totalDebit += $report['total_debit'];
            }

            
            // Expenses logic remains the same...

            $expensesReports = DB::table('expenses')
                ->select('type_of_expenses', DB::raw('SUM(amount) as total_amount'), DB::raw('COUNT(*) as expense_count'))
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                ->groupBy('type_of_expenses')
                ->get();

            $totalExpenses = DB::table('expenses')->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])->sum('amount');
            $CountExpenses = DB::table('expenses')->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])->count('type_of_expenses');

            $EexpensReport = [];
            foreach ($expensesReports as $report) {
                $EexpensReport[] = [
                    'expense_id' => null,
                    'expenses_name' => null,
                    'type_of_expenses' => $report->type_of_expenses,
                    'total_amount' => number_format($report->total_amount, 2),
                    'expense_count' => $report->expense_count,
                ];
            }

            $packageCount = DB::table('client_billings')
            ->select('package_id', DB::raw('count(package_id) as total'))
            ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate])
            ->whereNotNull('package_id')
            ->groupBy('package_id')
            ->count();
            
          // dd($packageCount);
            
            $dailyCount =  DB::table('subscriptions')
                ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                    ->where('type', 1) 
                    ->count();

                    $spaCount =  DB::table('subscriptions')
                    ->whereBetween(DB::raw('DATE(created_at)'), [$startDate, $endDate]) 
                        ->where('type', 2) 
                        ->count();
                        
                    //dd($packageCount = $packageCount + $dailyCount + $spaCount);

            return response()->json([
                'status' => 1,
                'message' => 'Billing Report Get Successfully',
                'data' => [
                    'packages' => [
                        'total_credit' => $totalCredit,
                        'total_debit' => $totalDebit,
                        'count' => $totCount, //$packageCount + $dailyCount + $SPACount,
                        'records' => $monthlyReport,
                    ],
                    'expenses' => [
                        'total_expents' => number_format($totalExpenses, 2),
                        'count' => $CountExpenses,
                        'records' => $EexpensReport,
                    ],
                ]
            ], 200);
        }
    }
    
    public function GetFilterData(Request $request)
    {
         $today = Carbon::today()->toDateString();
         $sevenDaysFromNow = Carbon::today()->addDays(7)->format('Y-m-d');
 
         $packages = Package::select('id','package_name')->get(); 
 
         $ExpireInSevenDays = DB::table('client_billings as cb')
            ->join('packages as p', 'cb.package_id', '=', 'p.id')
            ->join('users as u', 'cb.user_id', '=', 'u.id')
            ->whereBetween('cb.end_date', [$today, $sevenDaysFromNow])
            ->orWhere('cb.end_date','<',$today)
            ->select('cb.*', 'p.package_name', 'u.name', 'u.surname', 'u.gender','u.mobile_number as mobile_number','u.country_code')
            ->whereIn('cb.id', function($query) {
                $query->select(DB::raw('MAX(id)'))
                    ->from('client_billings')
                    ->groupBy('user_id');
            })
            ->get();

         

         foreach($ExpireInSevenDays as $ExpireInSevenDay)
         {
            $ClientBilling = DB::table('client_billings')
            ->where('user_id', $ExpireInSevenDay->user_id)
            ->orderBy('start_date', 'asc')
            ->get();

            $totalRemainingDays = 0;

            foreach ($ClientBilling as $index => $clientBill) {
                if ($index == 0) {
                    // Calculate the remaining days for the first package
                    $remainingDays = Carbon::now()->diffInDays(Carbon::parse($clientBill->end_date), false);

                    // Ensure that remaining days are never negative
                    // $remainingDays = max(0, $remainingDays);
                } else {
                    $ClientBillinglast = DB::table('client_billings')
                    ->where('user_id', $ExpireInSevenDay->user_id)
                    ->orderBy('start_date', 'asc')
                    ->first();
                    // Calculate the overlap or remaining days for the subsequent package
                    // $remainingDays = Carbon::parse($clientBill->start_date)->diffInDays(Carbon::parse($clientBill->end_date), false);

                    $remainingDays = Carbon::now()->diffInDays(Carbon::parse($ClientBillinglast->end_date), false);

                    // Ensure that remaining days are never negative
                    // $remainingDays = max(0, $remainingDays);

                    // Add remaining days to the total remaining days
                    $totalRemainingDays += $remainingDays;
                }
            }

            // Combine remaining days from the first and subsequent packages
            $combinedRemainingDays = $totalRemainingDays + isset($remainingDays) ? $remainingDays : 0;

            // Ensure that the combined remaining days are never negative
            // $combinedRemainingDays = max(0, $combinedRemainingDays);
           
            // Set the remaining days to the user's details
            $ExpireInSevenDay->remaining_days = $combinedRemainingDays;
             
         }
         
         // Prepare data for CSV export
        //  $csvData = [];
        //  $csvData[] = ['User Name', 'Package Name', 'Start Date', 'End Date', 'Amount', 'Balance', 'Description']; // CSV headers
        //  foreach ($ExpireInSevenDays as $item) {
        //      $csvData[] = [
        //          $item->user_name,
        //          $item->package_name,
        //          $item->start_date,
        //          $item->end_date,
        //          $item->amount,
        //          $item->balance,
        //          $item->description
        //      ];
        //  }
 
        //  // Generate CSV content
        //  $csvFileName = 'expire_in_seven_days.csv';
        //  $csvFilePath = public_path('downloads/' . $csvFileName); // Save in public/downloads
 
        //  // Create the directory if it doesn't exist
        //  if (!file_exists(public_path('downloads'))) {
        //      mkdir(public_path('downloads'), 0777, true);
        //  }
 
        //  $file = fopen($csvFilePath, 'w');
        //  foreach ($csvData as $line) {
        //      fputcsv($file, $line); // Write each line to CSV
        //  }
        //  fclose($file);
 
         // Generate download link
        // $csvDownloadLink = url('public/downloads/' . $csvFileName);
 
 
 
         return response()->json([
             'status' => 1,
             'data' => [
                 'last_senven_days_expire_data' => $ExpireInSevenDays,
                 'packages' => $packages,
                //  'links' => $csvDownloadLink // Return the download link
             ]
         ]);
    }
    
    
    public function getReportDetails(Request $request)
    {
        // return $request;
          $packages = Package::select('id as label','package_name as value')->get();
          
          $today = $request->start_date;
         $sevenDaysFromNow = $request->end_date;
 
         $packages = Package::select('id as value','package_name as label')->get(); 
         $packageIds = $request->packageIds ?? [];
         $ExpireInSevenDays = DB::table('client_billings as cb')
            ->join('packages as p', 'cb.package_id', '=', 'p.id')
            ->join('users as u', 'cb.user_id', '=', 'u.id')
            ->join('addresses as ad', 'cb.user_id', '=', 'ad.user_id')
            ->whereBetween('cb.start_date', [$today, $sevenDaysFromNow])
            ->whereIn('cb.package_id', $packageIds) // Filter by package IDs
            ->select('cb.*', 'p.package_name', 'u.name', 'u.surname', 'u.gender', 'u.mobile_number as mobile_number', 'u.country_code','ad.address_first')
            ->whereIn('cb.id', function($query) {
                $query->select(DB::raw('MAX(id)'))
                    ->from('client_billings')
                    ->groupBy('user_id');
            })
            ->get();
            // return $ExpireInSevenDays;
        // $ExpireInSevenDays =DB::table('users')->whereBetween('created_at', [$today, $sevenDaysFromNow])->get();
        // return $ExpireInSevenDays;
        // foreach($ExpireInSevenDays as $key=> $ExpireInSevenDay){
            
        // }
            
        //     return $ExpireInSevenDays;
            
          return response()->json([
             'status' => 1,
             'data' => [
                 'created_data' => $ExpireInSevenDays,
                 'packages' => $packages,
                //  'links' => $csvDownloadLink // Return the download link
             ]
         ]);
    }

    
}
