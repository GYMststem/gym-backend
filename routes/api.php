<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Admin\CenterController;
use App\Http\Controllers\Api\Admin\UserController;
use App\Http\Controllers\Api\Admin\PackageController;
use App\Http\Controllers\Api\Admin\CouponController;
use App\Http\Controllers\Api\Admin\SessionController;
use App\Http\Controllers\Api\Admin\RolePermissionController;
use App\Http\Controllers\Api\Admin\ExpensesController;
use App\Http\Controllers\Api\Admin\BillingController;

use App\Http\Controllers\Api\Customer\CustomerController; //Customer API

//Manager API
use App\Http\Controllers\Api\Manager\ManagerController;
use App\Http\Controllers\Api\Manager\ManagerCenterController; 
use App\Http\Controllers\Api\Manager\ManagerPackageController;
use App\Http\Controllers\Api\Manager\ManagerMemberController;
use App\Http\Controllers\Api\Admin\AttendanceController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/



Route::post('/login', [UserController::class, 'userLoginWithEmailAndPassword']);

Route::post('/forgot_password', [UserController::class, 'forgotPassword']);

Route::get('/attendance/sync', [AttendanceController::class, 'sync']);
Route::get('/attendance', [AttendanceController::class, 'show']);
Route::get('/zkteco/voice-test', [AttendanceController::class, 'voiceTest']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

 Route::middleware(['auth:sanctum'])->group(function () {
    // This route requires authentication and a valid Bearer token
    Route::post('/get_center', [CenterController::class, 'GetCenter']);
    Route::post('/create_center', [CenterController::class, 'CreateCenter']);
    Route::post('/update_center', [CenterController::class, 'updateCenter']);

    Route::post('/user_register', [UserController::class, 'userRegister']);
    Route::post('/get_user', [UserController::class, 'GetUsers']);
    Route::post('/update_client/{member_id}', [UserController::class, 'UpdateMember']);
    Route::delete('/delete_member/{id}', [UserController::class,'DeleteMember']);
    Route::post('/update_pause_client', [UserController::class, 'updatePauseClient']);
    Route::post('/edit_client', [UserController::class, 'EditMember']);
    Route::get('/get_shifts', [UserController::class, 'getShifts']);
    Route::post('/billing_create', [UserController::class, 'MemberBilling']);
    Route::get('/member_billing_detaile/{member_id}', [UserController::class, 'GetMemberBillingDetaile']);
    Route::delete('/delete_billing/{billing_id}', [UserController::class,'DeleteBilling']);
    Route::get('/get_client_id', [UserController::class, 'GetClientID']);
    
     Route::post('/create_client_subscription', [UserController::class, 'clientSubscription']);
    Route::post('/get_subscription_client', [UserController::class, 'GetSubscription']);
    
        // Route for adding a new user
    Route::post('/user_add', [UserController::class, 'addUser']); 
    // Route for updating an existing user
    Route::post('/user_add/{user_id}', [UserController::class, 'addUser']);
    
    Route::post('/get_user_list', [UserController::class, 'getUsersList']);
    Route::get('/get_user_list/{user_id}', [UserController::class, 'getUsersList']);
    Route::delete('/delete_user/{user_id}', [UserController::class, 'deleteUser']);
    
    Route::get('/dashboard', [UserController::class, 'Dashboard']);
    Route::get('/dashboard_graph', [UserController::class, 'DashboardGraph']);
    
    Route::post('/get_deleted_data_by_type', [UserController::class, 'GetDeletedDataByType']);
    
    Route::delete('/delete_subscription/{delete}', [UserController::class, 'DeleteSubcription']);
    Route::post('/approve_disapprove_delete_by_admin', [UserController::class, 'AdminApproveAndDisapproveDeleteRequest']);

    Route::post('/get_coupon', [CouponController::class, 'GetCoupon']);
    Route::post('/add_update_coupon', [CouponController::class, 'AddUpdateCoupon']);
    
    Route::post('/get_session', [SessionController::class, 'GetSession']);
    Route::post('/add_update_session', [SessionController::class, 'AddUpdateSession']);
    

    Route::post('/get_permission', [RolePermissionController::class, 'GetPermission']);
    Route::get('/get_role_permission', [RolePermissionController::class, 'GetRolePermission']);
    Route::post('/add_update_permission', [RolePermissionController::class, 'AddUpdatePermissions']);
    Route::post('/get_user_role_permission/{user_id}', [RolePermissionController::class, 'GetUserRolePermission']);
    

    Route::post('/get_roles', [RolePermissionController::class, 'GetRole']);
    Route::post('/add_update_roles', [RolePermissionController::class, 'AddUpdateRole']);
    
    

    Route::post('/get_packages', [PackageController::class, 'GetPackage']);
    Route::post('/get_packages_for_dropdown', [PackageController::class, 'GetPackageForDropdown']);
    Route::post('/get_packages/{package_id}', [PackageController::class, 'GetPackage']);
    Route::post('/add_update_packages', [PackageController::class, 'AddUpdatePackage']);
    Route::post('/cancel_packages', [PackageController::class, 'cancelMemberPackage']);
    Route::post('/update_member_package', [PackageController::class, 'UpdateMemberPackage']);
    Route::post('/renew_member_package', [PackageController::class, 'RenewMemberPackage']);
    
     Route::post('/get_package_by_gender', [PackageController::class, 'GetPackageByClient']);
     
    Route::delete('/delete_package/{package_id}', [PackageController::class, 'DeletePackage']);
    
    Route::post('/get_expenses', [ExpensesController::class, 'GetExpenses']);
    Route::post('/add_update_expenses', [ExpensesController::class, 'AddUpdateExpense']);
    Route::delete('/delete_expenses/{expense_id}', [ExpensesController::class, 'DeleteExpenses']);
    
    Route::get('/get_member_billing_list/{member_id?}', [BillingController::class, 'GetMemberBilling']);
      Route::post('/member_billing_payment_history', [BillingController::class, 'memberBillingPaymentHistory']);

    Route::post('/create_member_billing/{member_id}', [BillingController::class, 'CreateMemberBilling']);

    Route::delete('/delete_member_billing/{billing_id}', [BillingController::class, 'DeleteMemberBilling']);
    
    Route::post('/get_monthly_cash_report/{filter?}', [BillingController::class, 'GetMnthlyCashReport']);
    Route::get('/get_last_seven_days_expire', [BillingController::class, 'GetFilterData']);
     Route::post('/get_report_Details', [BillingController::class, 'getReportDetails']);
    
   Route::post('/update_active_account_client', [UserController::class, 'updateActiveAccountClient']);

   Route::post('/set-device-ip', [UserController::class, 'setDeviceIP']);
   Route::post('/get-device-ip', [UserController::class, 'getDeviceIP']);
   Route::post('/update-device-ip', [UserController::class, 'updateDeviceIP']);
   Route::post('/delete-device-ip', [UserController::class, 'deleteDeviceIP']);

    
    
 });


// Customer Api Start  09-09-2024

Route::post('/customer_login', [CustomerController::class, 'customerLogin']);

Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/customer_profile/{customer_id}', [CustomerController::class, 'customerProfile']);
    Route::post('/logout', [CustomerController::class, 'UserLogout']);
});

Route::post('/send_otp', [ManagerController::class, 'SendOtp']);
Route::post('/verify_otp', [ManagerController::class, 'verifyOtp']);
Route::post('/resend_otp', [ManagerController::class, 'resendOtp']);
Route::post('/manager_login', [ManagerController::class, 'managerLogin']);

Route::post('/manager_register', [ManagerController::class, 'ManagerRegister']);


 Route::middleware(['auth:sanctum'])->group(function () {

     Route::post('/set_password', [ManagerController::class, 'SetPassword']);
     Route::get('/manager_dashboard', [ManagerController::class, 'ManagerDashboard']);
     Route::get('/get_manager_profile', [ManagerController::class, 'GetManagerProfile']);
     
     
     Route::post('/manager_center_create', [ManagerCenterController::class, 'ManagerCreateCenter']);
     Route::post('/add_address/{user_id}', [ManagerCenterController::class, 'AddAddress']);  
     Route::post('/manager_package_create_or_update', [ManagerPackageController::class, 'CreateUpdatePackage']);  
     Route::post('/package_info/{center_id}/{package_id?}', [ManagerPackageController::class, 'GetPackageInfo']); 
     Route::post('/delete_package/{package_id?}', [ManagerPackageController::class, 'PackageDelete']); 
     Route::post('/member_register', [ManagerMemberController::class, 'MemberRegister']); 
     Route::post('/update_member_profile/{user_id?}', [ManagerMemberController::class, 'UpdateMemberDetaile']);
     Route::post('/member_detaile/{user_id?}', [ManagerMemberController::class, 'GetMemberDetails']); 
    //  Route::post('/member_detaile/{user_id?}', [ManagerMemberController::class, 'GetMemberDetails']); 
     
     
     
     
 });


