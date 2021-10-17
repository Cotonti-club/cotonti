<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=admin.config.edit.loop
 * [END_COT_EXT]
 */
/**
 * Payments module
 *
 * @package payments
 * @version 2.4.5
 * @author Kolev Andrew
 * @copyright Copyright (c) jCube Group
 * @license BSD
 */

defined('COT_CODE') or die('Wrong URL');


if ($p == 'hfu' && $cot_plugins_active["vuejs"] && (in_array($row['config_name'], [
        'rules',
    ]))) {
    $tt = new XTemplate(cot_tplfile('hfu.admin.config', 'plug', true));

    switch ($row["config_name"]) {
        case "rules":
            if (strlen($row["config_value"])) {
                $value = json_encode($row["config_value"], JSON_UNESCAPED_UNICODE);
            }else{
                $value = json_encode([], JSON_UNESCAPED_UNICODE);
            }
            break;
    }

    $tt->assign([
        "CONFIG_MODULES" => json_encode($cot_modules, JSON_UNESCAPED_UNICODE),
        "CONFIG_NAME" => $row["config_name"],
        "CONFIG_VALUE" => $value,
    ]);


    $tt->parse('MAIN');

    $t->assign(array(
        'ADMIN_CONFIG_ROW_CONFIG' => cot_config_input($row) . $tt->text('MAIN'),
    ));

}


