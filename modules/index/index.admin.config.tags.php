<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=admin.config.tags
 * [END_COT_EXT]
 */
/**
 * Payments module
 *
 * @package payments
 * @version 2.3.6
 * @author Kolev Andrew
 * @copyright Copyright (c) jCube Group
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');


if ($p == 'index' && $cot_plugins_active["vuejs"]){
    $vue = new Vue();
}
