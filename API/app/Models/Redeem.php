<?php
/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Handy Service Full App Flutter
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2022-present initappz.
*/
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Redeem extends Model
{
    protected $table = 'redeem';

    public $timestamps = true; //by default timestamp false

    protected $fillable = ['owner','redeemer','code','status','extra_field'];

    protected $hidden = [
        'updated_at', 'created_at',
    ];
}
