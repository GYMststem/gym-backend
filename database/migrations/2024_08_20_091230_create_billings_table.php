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
        Schema::create('billings', function (Blueprint $table) {
            $table->id();
            $table->string('user_id'); // the user applying the coupon 
            $table->string('package_id'); // the package for which the coupon is applied
            $table->decimal('discount_price', 8, 2); // discount amount (8 digits total, 2 after decimal)
            $table->decimal('final_price', 8, 2); // final price after applying the coupon
            $table->decimal('paid_amount', 8, 2); // amount paid by the user
            $table->decimal('payable_amount', 8, 2); // amount paid by the user 
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('billings');
    }
};
