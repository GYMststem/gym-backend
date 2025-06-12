<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ApplyCoupon extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'user_id',
        'coupon_id',  
        'applied_at',
        'billing_id',
        'package_id',
        'discount_price',
        'final_price',
        'paid_amount',
        'applied_at',
        'deleted_at',
        'deleted_by'
    ]; 
}
