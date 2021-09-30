<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pages extends Model
{
    //
    use SoftDeletes;
    protected $guarded = [];

    public function users(){
        return $this->belongsTo(User::class,'user_id','id');
    }
}
