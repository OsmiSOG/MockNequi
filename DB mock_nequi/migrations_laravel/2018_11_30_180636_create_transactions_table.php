<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->increments('id');
            $table->enum('type', ['load','outflows']);
            $table ->string('origin_pocket');
            $table ->unsignedInteger('money');
            $table ->string('sender');
            $table ->string('email_addressee');
            $table ->unsignedInteger('account_id');
            $table ->unsignedInteger('description_movement_id');
            $table->timestamps();
            $table->foreign('account_id')->references('id')->on('accounts');
            $table->foreign('description_movement_id')->references('id')->on('description_movements');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
