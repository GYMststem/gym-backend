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

        Schema::create('renew_packages', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->integer('package_id');
            $table->date('renew_start_date');
            $table->date('renew_end_date');
            $table->integer('renew_no_of_days'); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('renew_packages');
    }
};
