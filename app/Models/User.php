<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\SoftDeletes;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable,HasRoles,SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'surname',
        'email',
        'password',
        'role', // role name '1 admin','2 employee','3 member', '4 visitor'
        'center_id', // Center_id
        'mobile_number',
        'gym_member_code',
        'gender',
        'image',
        'occupation_id',
        'marital_status',
        'date_of_birth',
        'visit_date',
        'joining_date',
        'anniversary_date',
        'tentative_joining_date',
        'inquiry_mode',
        'description',
        'remark', // 1 Hot, 2 Cold
        'source_id', 
        'employee_id_proof',
        'status', // 1 Active and 2 inactive,
        'starting_date',
        'end_date',
        'client_id',
        'country_code',
        'otp',
        'otp_created_at',
        'otp_verified',
        'deleted_at',
        'shift_id',
        'created_by',
        'updated_by',
        'deleted_by',
        'pause_date',
        'paused_days',
        'suspend_type'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    // Define the relationship
    public function center()
    {
        return $this->hasOne(Center::class, 'user_id');
    }
    
}
