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
        Schema::create('sessions', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->integer('center_id');
            $table->date('session_date');
            $table->time('start_time');
            $table->time('end_time');
            $table->integer('number_of_member_capacity');
            $table->string('status')->comment('1 active, 2 inactive');
            $table->timestamps();

            // Assuming there is a centers table and center_id is a foreign key
            // $table->foreign('center_id')->references('id')->on('centers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sessions');
    }
};
