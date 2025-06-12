<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Expenses extends Model
{
    use HasFactory,SoftDeletes;
 
    protected $fillable = [
        'id',
        'title',
        'amount',
        'center_id',
        'expense_date',
        'payment_mode',
        'type_of_expenses',
        'remark',
        'deleted_at',
        'deleted_by',
        'created_by',
        'updated_by'
    ];
}
