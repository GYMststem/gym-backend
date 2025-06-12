<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Package extends Model
{ 
    use HasFactory,SoftDeletes;
  
    protected $fillable = [
        'package_name', 
        'price',
        'center_id',
        'no_of_days',
        'product_type',
        'training_type',    //'1: general, 2: personal'
        'package_timing', //'1: normal hours, 2: sunny hours'
        'package_type', //'1: main, 2: add on'
        'show_at_advicefit_platform',
        'status', //'1: active, 2: inactive',
        'deleted_at',
        'deleted_by',
        'created_by', //'
        'updated_by', //'
        'type'

    ];
}
