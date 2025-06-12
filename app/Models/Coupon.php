<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory; 
     
    protected $fillable = [
        'coupon_name',
        'amount',  
        'percentage',
        'center_id',
        'coupon_start_date',
        'coupon_end_date',
        'status',  //'1: active, 2: inactive'
        'comments'
    ]; 
}
