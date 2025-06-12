<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Billing extends Model
{
    use HasFactory;



    protected $fillable = [
        'user_id',  
        'package_id',
        'discount_price',
        'final_price',
        'paid_amount', 
        'payable_amount',
        'remark'
    ]; 
}
