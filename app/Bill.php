<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Customer;
use Illuminate\Database\Eloquent\SoftDeletes;

class Bill extends Model
{
    //
    use SoftDeletes;
    protected $table = 'bills';
    protected $guarded = [];

    public function customers(){
        return $this->belongsTo(Customer::class,'customer_id');
    }
}
