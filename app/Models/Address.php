<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Address extends Model
{
    use HasFactory,SoftDeletes;
 
    protected $fillable = [
        'address_first', 
        'address_second',
        'user_id',
        'city_id',
        'state_id',
        'pincode', 
        'longitude',
        'latitude',
        'deleted_at',
        'deleted_by'
    ];
}
