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

        Schema::create('centers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('address_line_1')->nullable();
            $table->string('address_line_2')->nullable();
            $table->integer('city_id')->nullable();
            $table->integer('state_id')->nullable();
            $table->string('pin_code')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('centers');
    }
};
