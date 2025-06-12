<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Center extends Model
{
    use HasFactory;
 

    protected $fillable = [
        'name',
        'state_id',  
        'address_line_1',
        'address_line_2',
        'city_id',
        'pin_code',
        'user_id',
        'longitude',
        'latitude'
    ];
}
