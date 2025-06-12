<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\PaymentController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');

   
});

Route::post('/stripe',[PaymentController::class, 'stripe'])->name('stripe');
Route::get('/success',[PaymentController::class, 'success'])->name('success');
Route::get('/cancel',[PaymentController::class, 'cancel'])->name('cancel');

 

Route::post('/upload',[PaymentController::class, 'ImageCompressor'])->name('imagess');


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
