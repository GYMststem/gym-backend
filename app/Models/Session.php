<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    use HasFactory;
    

    protected $fillable = [
        'title', 
        'center_id',
        'session_date',
        'start_time',
        'end_time',
        'number_of_member_capacity',
        'status'  // '1 active, 2 inactive'
    ];
}
