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
        Schema::create('members_plans', function (Blueprint $table) { 
            $table->id();
            $table->integer('user_id');
            $table->integer('package_id'); 
            $table->string('package_name');
            $table->decimal('price', 10, 2);
            $table->unsignedInteger('center_id');
            $table->integer('no_of_days');
            $table->string('product_type');
            $table->string('training_type')
                  ->comment('1: general, 2: personal');
            $table->string('package_timing',)
                  ->comment('1: normal hours, 2: sunny hours');
            $table->string('package_type')
                  ->comment('1: main, 2: add on');
            $table->date('date_from')->nullable();
            $table->date('date_to')->nullable();
            $table->decimal('manual_price',10, 2)->nullable(); 
            $table->boolean('membership_type')->default(0)->comment('0: package, 1: menual_type'); 
            $table->boolean('show_at_advicefit_platform')->default(false);
            $table->boolean('status')->comment('1: active, 2: inactive');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('members_plans');
    }
};
