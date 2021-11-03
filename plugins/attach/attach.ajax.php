<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=ajax
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL');

$tiny = $cfg["plugin"]["attach"]["tinypng"];
$tinyKey = $cfg["plugin"]["attach"]["tinypngKey"];
$tinyMAX = $cfg["plugin"]["attach"]["tinyMAX"];
$w = $cfg["plugin"]["attach"]["w"];
$h = $cfg["plugin"]["attach"]["h"];

include_once cot_incfile("attach", "plug");


$a = cot_import("att_a", "G", "TXT");
$item = cot_import("item", "G", "INT");

if ($a == "sortable") {
    unset($_POST["x"]);
    foreach ($_POST as $item_id => $item_order) {
        $db->query("UPDATE `{$db_attach}` SET `att_order` = '{$item_order}' WHERE `att_id` = {$item_id}");
    }
    exit;
} elseif ($a == "delete" && !empty($item)) {
    $file = $db->query("SELECT * FROM {$db_attach} WHERE att_id={$item} ")->fetch();
    unlink($file["att_filepath"] . "/" . $file["att_filename"]);
    $db->delete($db_attach, "att_id={$item}");
    exit;
} elseif (!empty($_FILES)) {

    if ($tiny) {
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Exception.php");
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/ResultMeta.php");
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Result.php");
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Source.php");
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify/Client.php");
        require_once($cfg["plugins_dir"] . "/attach/lib/Tinify.php");
    }

    require_once $cfg["plugins_dir"] . '/attach/lib/FileAPI.class.php';
    require_once $cfg["plugins_dir"] . '/attach/lib/SimpleImage.php';

    $id = $id ? $id : cot_import("id", "G", "TXT");
    $target = cot_import("target", "P", "TXT");
    $x = cot_import("x", "P", "TXT");
    if (empty($x) || empty($_FILES)) {
        return false;
    }
// получаем настройки для плагина
    $target = explode("-", $target);
    $tpaset = str_replace("\r\n", "\n", $cfg["plugin"]["attach"]["set"]);
    $tpaset = array_filter(explode("\n", $tpaset));
    $conf = array();
    if (!empty($tpaset)) {
        foreach ($tpaset as $k => $v) {
            $v = explode('|', $v);
            $v = array_map('trim', $v);
            $conf[$v[0]][$v[1]]["module"] = $v[0];
            $conf[$v[0]][$v[1]]["field"] = $v[1];
            $conf[$v[0]][$v[1]]["folder"] = $v[2];
            $conf[$v[0]][$v[1]]["req"] = $v[3];
            $conf[$v[0]][$v[1]]["ext"] = $v[4];
            $conf[$v[0]][$v[1]]["files"] = $v[5];
        }
    }
    $sett = $conf[$target[0]][$target[1]];

// если папки нет создаем ее.
    if (!is_dir($sett["folder"])) {
        mkdir($sett["folder"], 0755, true);
    }

    $uploaddir = $sett["folder"];
    $filename = substr(md5(time()), 2, 5) . "_" . basename($_FILES['file']['name']);
    $uploadfile = $uploaddir . "/" . $filename;
    $path_parts = pathinfo($uploadfile);
    $extension = mb_strtolower($path_parts['extension']);



    switch ($extension) {
        case "jpg":
        case "jpeg":
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

    if (!empty($id)) {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$sett["field"]}' && att_extension='{$sett["module"]}' && att_code='{$id}' ORDER BY att_id DESC ")->fetchAll();
    } else {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$sett["field"]}' && att_extension='{$sett["module"]}' && att_x='" . $x . "' ORDER BY att_id DESC ")->fetchAll();
    }
    if (count($files) >= $sett["files"]) {
        $res["message"] = "Вы можете загрузить максимум {$sett["files"]} файлов";
        print json_encode($res);
        return false;
    }

    if ($mime_type == "image") {
        if ($tiny) {
            try {
                \Tinify\setKey($tinyKey);
                \Tinify\validate();
                $source = \Tinify\fromFile($_FILES['file']['tmp_name']);
                if ($source->toFile($uploaddir . "/" . $filename)) {
                    $db->insert($db_attach, array(
                        "att_userid" => $usr["id"],
                        "att_extension" => $sett["module"],
                        "att_category" => $sett["field"],
                        "att_code" => $id,
                        "att_x" => $x,
                        "att_filepath" => $uploaddir,
                        "att_filename" => $filename,
                        "att_fileorigname" => $path_parts["filename"],
                        "att_fileext" => $extension,
                        "att_filesize" => @filesize($filename),
                        "att_type" => $mime_type,
                        "att_order" => count($files),
                    ));
                    $id = $db->lastInsertId();
                    $img = new abeautifulsite\SimpleImage($uploadfile);
                    $res = array();
                    $res["preview"] = $img->thumbnail($w, $h)->output_base64();
                    $res["id"] = $id;
                    print json_encode($res);
                    exit;
                }
            } catch (\Tinify\AccountException $e) {
                $res["error"] = "AccountException" . $e->getMessage();
                // Verify your API key and account limit.
            } catch (\Tinify\ClientException $e) {
                $res["error"] = "ClientException" . $e->getMessage();
                // Check your source image and request options.
            } catch (\Tinify\ServerException $e) {
                $res["error"] = "ServerException" . $e->getMessage();
                // Temporary issue with the Tinify API.
            } catch (\Tinify\ConnectionException $e) {
                $res["error"] = "ConnectionException" . $e->getMessage();
                // A network connection error occurred.
            } catch (Exception $e) {
                $res["error"] = "Exception" . $e->getMessage();
                // Something else went wrong, unrelated to the Tinify API.
            }
        } else {
            if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
                $db->insert($db_attach, array(
                    "att_userid" => $usr["id"],
                    "att_extension" => $sett["module"],
                    "att_category" => $sett["field"],
                    "att_code" => $id,
                    "att_x" => $x,
                    "att_filepath" => $uploaddir,
                    "att_filename" => $filename,
                    "att_fileorigname" => $path_parts["filename"],
                    "att_fileext" => $extension,
                    "att_filesize" => @filesize($filename),
                    "att_type" => $mime_type,
                    "att_order" => count($files),
                ));
                $id = $db->lastInsertId();
                $img = new abeautifulsite\SimpleImage($uploadfile);
                $res = array();
                $res["preview"] = $img->thumbnail($w, $h)->output_base64();
                $res["id"] = $id;
                print json_encode($res);
                exit;
            }
        }
    } else {
        if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile)) {
            $db->insert($db_attach, array(
                "att_userid" => $usr["id"],
                "att_extension" => $sett["module"],
                "att_category" => $sett["field"],
                "att_code" => $id,
                "att_x" => $x,
                "att_filepath" => $uploaddir,
                "att_filename" => $filename,
                "att_fileorigname" => $path_parts["filename"],
                "att_fileext" => $extension,
                "att_filesize" => @filesize($filename),
                "att_type" => $mime_type,
                "att_order" => count($files),
            ));
            $id = $db->lastInsertId();
            $res = array();
            $res["id"] = $id;
            $res["mime_type"] = $mime_type;
            print json_encode($res);
            exit;
        }
    }
}