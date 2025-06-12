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
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('coupon_name', 255);
            $table->decimal('amount', 10, 2);
            $table->decimal('percentage', 5, 2);
            $table->integer('center_id')->unsigned();
            $table->date('coupon_start_date');
            $table->date('coupon_end_date');
            $table->string('status')->comment('1: active, 2: inactive');
            $table->text('comments')->nullable();
            $table->timestamps();
            
            // Foreign key constraint (assuming centers table exists)
            // $table->foreign('center_id')->references('id')->on('centers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('coupons');
    }
};
