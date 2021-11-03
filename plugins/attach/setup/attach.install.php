<?php

/**
 * Installation handler
 * @version 1.0
 * @package MSG
 * @copyright (c) PluginsPro Team (http://cmsworks.ru/users/alexvlad)
 */
defined('COT_CODE') or die('Wrong URL');

include_once cot_incfile("attach", "plug");
global $db, $cot_plugins_active, $db_attach;


if ($cot_plugins_active["mavatars"]) {
    $import_mavatars = cot_import("import_mavatars", "G", "TXT");
    if (empty($import_mavatars)) {

        $t = new XTemplate(cot_tplfile('attach.install', 'plug', false));

        $t->parse('MAIN');
        print $t->text('MAIN');
        exit;
    } elseif ($import_mavatars == "yes") {
        include_once cot_incfile("mavatars", "plug");
        global $db_mavatars;

        $ma = $db->query("SELECT * FROM `{$db_mavatars}`")->fetchAll();

        foreach ($ma as $v) {
            switch ($v["mav_fileext"]) {
                case "jpg":
                case "gif":
                case "png":
                    $mime_type = "image";
                    break;
                case "zip":
                case "rar":
                    $mime_type = "archive";
                    break;
                case "doc":
                case "docx":
                case "txt":
                    $mime_type = "document";
                    break;
                case "exe":
                    $mime_type = "application";
                    break;
                default :
                    $mime_type = "undefined";
                    break;
            }

            $db->insert($db_attach, [
                "att_userid" => $v["mav_userid"],
                "att_extension" => $v["mav_extension"],
                "att_category" => "mavatars",
                "att_code" => $v["mav_code"],
                "att_item" => $v["mav_item"],
                "att_x" => "",
                "att_filepath" => $v["mav_filepath"],
                "att_filename" => $v["mav_filename"] . "." . $v["mav_fileext"],
                "att_fileext" => $v["mav_fileext"],
                "att_fileorigname" => $v["mav_fileorigname"],
                "att_thumbpath" => $v["mav_thumbpath"],
                "att_filesize" => $v["mav_filesize"],
                "att_desc" => $v["mav_desc"],
                "att_order" => $v["mav_order"],
                "att_type" => $mime_type,
            ]);
        }
    } else {
        return true;
    }
}