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


if ($p == 'index' && $cot_plugins_active["vuejs"] && (in_array($row['config_name'], [
        'json',
    ]))) {
    $tt = new XTemplate(cot_tplfile('index.admin.config', 'module', true));

    $file = "{$cfg['themes_dir']}/{$cfg['defaulttheme']}/{$cfg['defaulttheme']}.index.cfg.php";
    if(file_exists($file)){
        $configs = include_once $file;
    }
    $excfg = json_decode($cfg["index"]["json"], 1);


    if($configs)
        foreach ($configs as $k=>&$config){
            foreach ($config["values"] as $kk => &$value) {
                $value["value"] = $excfg[$k]["values"][$kk]["value"];
            }
        }

    $tt->assign([
        "CONFIG_NAME" => $row["config_name"],
        "CONFIG_ITEMS" => json_encode($configs),
    ]);


    $tt->parse('MAIN');

    $t->assign(array(
        'ADMIN_CONFIG_ROW_CONFIG' => cot_config_input($row) . $tt->text('MAIN'),
    ));

}


