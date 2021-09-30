<?php
namespace App\Helper;

use App\Setting;

class getConfigValue{
    public static function getConfigValue($configKey){
        $setting = Setting::select('config_key','config_value')->where('config_key',$configKey)->first();
        if (!empty($setting)){
            return $setting->config_value;
        }
        return null;
    }
}
