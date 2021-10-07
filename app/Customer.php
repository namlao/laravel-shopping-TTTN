<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    //
    protected $table = 'customers';
    protected $guarded = [];
    public function bill(){
        return $this->hasOne(Bill::class,'customer_id');
    }
}
