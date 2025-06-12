<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->integer('mobile_number');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('role')->comment('1 admin, 2 employee, 3 member, 4 visitor');
            $table->foreignId('center_id')->constrained();
            $table->string('mobile');
            $table->string('gym_member_code')->nullable();
            $table->string('gender')->nullable();
            $table->string('image')->nullable();
            $table->string('occupation')->nullable();
            $table->string('marital_status')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->date('visit_date')->nullable();
            $table->date('joining_date')->nullable();
            $table->date('anniversary_date')->nullable();
            $table->text('description')->nullable();
            $table->text('remark')->nullable()->comment('1 Hot, 2 Cold');
            $table->foreignId('source_id')->constrained();
            $table->string('employee_id_proof')->nullable();
            $table->string('status')->comment('1 Active, 2 inactive');
            $table->rememberToken();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
