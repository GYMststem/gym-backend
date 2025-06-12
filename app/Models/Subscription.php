<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subscription extends Model
{
 
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'name',
        'surname',
        'email',
        'mobile',
        'gender',
        'date',
        'paid_amount',
        'payable_amount', 
        'remark',
        'type',
        'deleted_at',
        'deleted_by',
        'created_by',
        'package_id',
        'daily_sub_id'
    ];
}
