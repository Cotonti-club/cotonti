<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=admin.config.edit.loop
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL');

if ($p == 'hfu' && $cot_plugins_active["hfu"] && $cot_plugins_active["vuejs"]) {
    $vue = new Vue();
    $vue->add("vue-multiselect", 1);
}


