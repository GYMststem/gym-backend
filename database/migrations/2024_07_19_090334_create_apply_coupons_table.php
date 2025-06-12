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
        
        Schema::create('apply_coupons', function (Blueprint $table) {
            $table->id();
            $table->string('user_id'); // the user applying the coupon
            $table->string('coupon_id'); // the coupon being applied
            $table->string('package_id'); // the package for which the coupon is applied
            $table->decimal('discount_price', 8, 2); // discount amount (8 digits total, 2 after decimal)
            $table->decimal('final_price', 8, 2); // final price after applying the coupon
            $table->decimal('paid_amount', 8, 2); // amount paid by the user
            $table->timestamp('applied_at')->nullable(); // when the coupon was applied
            $table->timestamps();

            // Foreign key constraints
            // $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('coupon_id')->references('id')->on('coupons')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('apply_coupons');
    }
};
