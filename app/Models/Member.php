<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'assigned_users_id',  
        'package_id',
        'date_from',
        'date_to',
        'manual_price',
        'membership_type', //0 package,1 menual_type
    ]; 
}
