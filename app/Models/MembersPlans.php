<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MembersPlans extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'package_id',
        'package_name', 
        'price',
        'center_id',
        'no_of_days',
        'product_type',
        'training_type',    //'1: general, 2: personal'
        'package_timing', //'1: normal hours, 2: sunny hours'
        'package_type', //'1: main, 2: add on'
        'show_at_advicefit_platform',
        'status', //'1: active, 2: inactive' 
        'date_from',
        'date_to',
        'manual_price',
        'membership_type', //0 package,1 menual_type
        'renew_start_date',
        'renew_end_date',
        'renew_no_of_days',
        'type'
    ];
}
