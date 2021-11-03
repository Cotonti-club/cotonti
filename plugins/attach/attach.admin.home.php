<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=admin.home.sidepanel
  Order=1
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL');


$tiny = $cfg["plugin"]["attach"]["tinypng"];
$tinyKey = $cfg["plugin"]["attach"]["tinypngKey"];
$tinyMAX = $cfg["plugin"]["attach"]["tinyMAX"];

if ($tiny) {

    require_once cot_incfile('attach', 'plug');
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Exception.php");
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/ResultMeta.php");
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Result.php");
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Source.php");
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Client.php");
    require_once($cfg["plugins_dir"] . "/attach/lib/Tinify.php");

    $tt = new XTemplate(cot_tplfile('attach.admin.home', 'plug', true));
    try {
        \Tinify\setKey($tinyKey);
        \Tinify\validate();
        $compressionsThisMonth = \Tinify\compressionCount();
        $tt->assign(array(
            "TINY_COUNT" => $compressionsThisMonth,
            "TINY_MAX" => $tinyMAX ?: 500,
        ));
    } catch (\Tinify\Exception $e) {
        // Validation of API key failed.
    }


    $tt->parse('MAIN');

    $line = $tt->text('MAIN');
}

