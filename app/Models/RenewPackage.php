<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RenewPackage extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'package_id', 
        'renew_start_date',
        'renew_end_date',
        'renew_no_of_days',
        'coupon_id',
    ];
}
