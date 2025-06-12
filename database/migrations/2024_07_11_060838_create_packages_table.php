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
        Schema::create('packages', function (Blueprint $table) {
            $table->id();
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
            $table->boolean('show_at_advicefit_platform')->default(false);
            $table->boolean('status')->comment('1: active, 2: inactive');
            $table->timestamps();
 

            // $table->foreign('center_id')->references('id')->on('centers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('packages');
    }
};
