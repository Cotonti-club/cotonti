<?php

defined('COT_CODE') or die('Wrong URL');

require_once cot_langfile('attach', "plug", "ru");
$db_attach = (isset($db_attach)) ? $db_attach : $db_x . 'attach';

function cot_attach_form($field, $id = null, $template = "") {
    global $cfg, $db, $db_attach;

    include_once $cfg["plugins_dir"] . '/attach/lib/FileAPI.class.php';
    include_once $cfg["plugins_dir"] . '/attach/lib/SimpleImage.php';

    $e = cot_import("e", "G", "TXT");
    $x = cot_xg();
    $w = $cfg["plugin"]["attach"]["w"];
    $h = $cfg["plugin"]["attach"]["h"];


    $tpaset = str_replace("\r\n", "\n", $cfg["plugin"]["attach"]["set"]);
    $tpaset = array_filter(explode("\n", $tpaset));
    $conf = array();
    if (!empty($tpaset)) {
        foreach ($tpaset as $k => $v) {
            $v = explode('|', $v);
            $v = array_map('trim', $v);
            if ($v[1] == $field && $v[0] == $e) {
                $conf["module"] = $v[0];
                $conf["field"] = $v[1];
                $conf["folder"] = $v[2];
                $conf["req"] = $v[3];
                $conf["ext"] = $v[4];
                $conf["files"] = $v[5];
            }
        }
    }
    if (empty($conf)) {
        return false;
    }
    $t = new XTemplate(cot_tplfile("attach.form." . $template, 'plug'));



    if (!empty($id)) {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$conf["field"]}' && att_extension='{$conf["module"]}' && att_code='{$id}' ORDER BY att_order ASC ")->fetchAll();
    } else {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$conf["field"]}' && att_extension='{$conf["module"]}' && att_x='" . substr($x, 2) . "' ORDER BY att_order ASC ")->fetchAll();
    }


    foreach ($files as $i => $file) {
        if ($file["att_type"] == "image" && file_exists($file["att_filepath"] . "/" . $file["att_filename"])) {
            $img = new abeautifulsite\SimpleImage($file["att_filepath"] . "/" . $file["att_filename"]);
            $thumb = $img->thumbnail($w, $h)->output_base64();
        } else {
            $thumb = "plugins/attach/assets/images/{$file["att_type"]}.png";
        }
        $t->assign(array(
            'ATTACH_BLOCKID' => $conf["module"] . "-" . $conf["field"],
            'ATTACH_FILE_ID' => $file["att_id"],
            'ATTACH_FILE_PREFIX' => $file["att_category"],
            'ATTACH_FILE_PATH' => $file["att_filepath"],
            'ATTACH_FILE_NANE' => $file["att_filename"],
            'ATTACH_FILE_ORIGNANE' => $file["att_fileorigname"] . "." . $file["att_fileext"],
            'ATTACH_FILE_FULLPATH' => $file["att_filepath"] . "/" . $file["att_filename"],
            'ATTACH_FILE_THUMB' => $thumb,
            'ATTACH_FILE_EXT' => $file["att_fileext"],
            'ATTACH_FILE_SIZE' => $file["att_filesize"],
            'ATTACH_FILE_TYPE' => $file["att_type"],
            'ATTACH_FILE_STATE' => $attached["save"] ? $attached["save"][$i] : 1,
        ));
        $t->parse("MAIN.FILES");
    }

    $params = array(
        "multiple" => true,
        "data-attach" => $conf["module"] . "-" . $conf["field"],
        "accept" => $conf["ext"],
    );
    $req_params = array(
        "data-attach" => "req-" . $conf["module"] . "-" . $conf["field"],
        "req-hidden" => 1
    );

    if($conf["req"]){
        $req_params['required'] = true;
    }

    $arr = array(
        'ATTACH_BLOCKID' => $conf["module"] . "-" . $conf["field"],
        'ATTACH_PATH' => $conf["folder"],
        'ATTACH_MAXFILES' => $conf["files"],
        'ATTACH_FORMATS' => $conf["ext"],
        'ATTACH_INPUT' => cot_inputbox("text", null, count($files) ? : null, $req_params) . "\r\n" . cot_inputbox("file", $conf["module"] . "_" . $conf["field"] . "[]", null, $params),
        'ATTACH_AJAXURL' => "index.php?r=attach&att_id={$id}&att_e={$e}&scheme={$name}&" . $x
    );

    $t->assign($arr);
    $t->parse("MAIN");

    return $t->text();
}

function cot_attach_form_admin($ext, $field, $id = null, $template = "") {
    global $cfg, $db, $db_attach;

    include_once $cfg["plugins_dir"] . '/attach/lib/FileAPI.class.php';
    include_once $cfg["plugins_dir"] . '/attach/lib/SimpleImage.php';

    $e = $ext;
    $x = cot_xg();
    $w = $cfg["plugin"]["attach"]["w"];
    $h = $cfg["plugin"]["attach"]["h"];


    $tpaset = str_replace("\r\n", "\n", $cfg["plugin"]["attach"]["set"]);
    $tpaset = array_filter(explode("\n", $tpaset));
    $conf = array();
    if (!empty($tpaset)) {
        foreach ($tpaset as $k => $v) {
            $v = explode('|', $v);
            $v = array_map('trim', $v);
            if ($v[1] == $field && $v[0] == $e) {
                $conf["module"] = $v[0];
                $conf["field"] = $v[1];
                $conf["folder"] = $v[2];
                $conf["req"] = $v[3];
                $conf["ext"] = $v[4];
                $conf["files"] = $v[5];
            }
        }
    }
    if (empty($conf)) {
        return false;
    }
    $t = new XTemplate(cot_tplfile("attach.form." . $template, 'plug'));



    if (!empty($id)) {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$conf["field"]}' && att_extension='{$conf["module"]}' && att_code='{$id}' ORDER BY att_order ASC ")->fetchAll();
    } else {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$conf["field"]}' && att_extension='{$conf["module"]}' && att_x='" . substr($x, 2) . "' ORDER BY att_order ASC ")->fetchAll();
    }


    foreach ($files as $i => $file) {
        if ($file["att_type"] == "image" && file_exists($file["att_filepath"] . "/" . $file["att_filename"])) {
            $img = new abeautifulsite\SimpleImage($file["att_filepath"] . "/" . $file["att_filename"]);
            $thumb = $img->thumbnail($w, $h)->output_base64();
        } else {
            $thumb = "plugins/attach/assets/images/{$file["att_type"]}.png";
        }
        $t->assign(array(
            'ATTACH_BLOCKID' => $conf["module"] . "-" . $conf["field"],
            'ATTACH_FILE_ID' => $file["att_id"],
            'ATTACH_FILE_PREFIX' => $file["att_category"],
            'ATTACH_FILE_PATH' => $file["att_filepath"],
            'ATTACH_FILE_NANE' => $file["att_filename"],
            'ATTACH_FILE_ORIGNANE' => $file["att_fileorigname"] . "." . $file["att_fileext"],
            'ATTACH_FILE_FULLPATH' => $file["att_filepath"] . "/" . $file["att_filename"],
            'ATTACH_FILE_THUMB' => $thumb,
            'ATTACH_FILE_EXT' => $file["att_fileext"],
            'ATTACH_FILE_SIZE' => $file["att_filesize"],
            'ATTACH_FILE_TYPE' => $file["att_type"],
            'ATTACH_FILE_STATE' => $attached["save"] ? $attached["save"][$i] : 1,
        ));
        $t->parse("MAIN.FILES");
    }

    $params = array(
        "multiple" => true,
        "data-attach" => $conf["module"] . "-" . $conf["field"],
        "accept" => $conf["ext"],
    );

    $req_params = array(
        "data-attach" => "req-" . $conf["module"] . "-" . $conf["field"],
        "req-hidden" => 1
    );

    if($conf["req"]){
        $req_params['required'] = true;
    }


    $arr = array(
        'ATTACH_BLOCKID' => $conf["module"] . "-" . $conf["field"],
        'ATTACH_PATH' => $conf["folder"],
        'ATTACH_MAXFILES' => $conf["files"],
        'ATTACH_FORMATS' => $conf["ext"],
        'ATTACH_INPUT' => cot_inputbox("text", null, count($files) ? : null, $req_params) . "\r\n" . cot_inputbox("file", $conf["module"] . "_" . $conf["field"] . "[]", null, $params),
        'ATTACH_AJAXURL' => "index.php?r=attach&att_id={$id}&att_e={$e}&scheme={$name}&" . $x
    );

    $t->assign($arr);
    $t->parse("MAIN");

    return $t->text();
}

function cot_attach_files($field, $id = null, $limit = 0, $offset = 0, $template = "", $e = null) {
    global $cfg, $db, $db_attach;

    $limit = $limit ? "LIMIT {$offset}, {$limit}" : null;
    if ($limit == 0 && $offset != 0) {
        $limit = "LIMIT {$offset}, 100";
    }

    $script = $_SERVER["SCRIPT_NAME"];
    if ($script == "/admin.php") {
        $e = $e ? : cot_import("m", "G", "TXT");
    } else {
        $e = $e ? : cot_import("e", "G", "TXT");
    }

    $t = new XTemplate(cot_tplfile("attach." . $template, 'plug'));

    if (!empty($id)) {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$field}' && att_extension='{$e}' && att_code='{$id}' ORDER BY att_order ASC {$limit} ")->fetchAll();
    }

    if (is_array($files)) {
        foreach ($files as $file) {
            if (file_exists($file["att_filepath"] . "/" . $file["att_filename"])) {
                $arr = array(
                    "ATTACH_ROW_ID" => $file["att_id"],
                    "ATTACH_ROW_EXT" => $file["att_extension"],
                    "ATTACH_ROW_PATH" => $file["att_filepath"],
                    "ATTACH_ROW_FULLPATH" => $file["att_filepath"] . "/" . $file["att_filename"],
                    "ATTACH_ROW_NAME" => $file["att_filename"],
                    "ATTACH_ROW_TYPE" => $file["att_type"] ? : "undefined",
                );
                $t->assign($arr);
                $t->parse("MAIN.ROWS");
            }
        }
    }
    $arr = array();

    $t->assign($arr);
    $t->parse("MAIN");

    return $t->text();
}

function cot_attach($field, $id = null, $limit = 0, $offset = 0, $e = null) {
    global $cfg, $db, $db_attach;

    $limit = $limit ? "LIMIT {$offset}, {$limit}" : null;
    if ($limit == 0 && $offset != 0) {
        $limit = "LIMIT {$offset}, 100";
    }

    $script = $_SERVER["SCRIPT_NAME"];
    if ($script == "/admin.php") {
        $e = $e ? : cot_import("m", "G", "TXT");
    } else {
        $e = $e ? : cot_import("e", "G", "TXT");
    }

    if (!empty($id)) {
        $files = $db->query("SELECT * FROM `{$db_attach}` WHERE att_category='{$field}' && att_extension='{$e}' && att_code='{$id}' ORDER BY att_order ASC {$limit} ")->fetchAll();
    }

    $arr = array();
    if (is_array($files)) {
        foreach ($files as $file) {
            if (file_exists($file["att_filepath"] . "/" . $file["att_filename"])) {
                $arr[] = array(
                    "ATTACH_ROW_ID" => $file["att_id"],
                    "ATTACH_ROW_EXT" => $file["att_extension"],
                    "ATTACH_ROW_PATH" => $file["att_filepath"],
                    "ATTACH_ROW_FULLPATH" => $file["att_filepath"] . "/" . $file["att_filename"],
                    "ATTACH_ROW_NAME" => $file["att_filename"],
                    "ATTACH_ROW_TYPE" => $file["att_type"] ? : "undefined",
                );
            }
        }
    }
    return $arr;
}

function cot_attach_one($field, $id = null, $offset = 0, $e = null) {
    $files = cot_attach($field, $id, 1, $offset, $e);
    return current($files);
}

function cot_attach_thumb($image, $size = "150x200", $type = "b") {
    global $cfg;

    if(is_array($image) ){
        $image = $image["ATTACH_ROW_FULLPATH"] ?: '';
    }
    if(empty($image)){
        return false;
    }


    include_once $cfg["plugins_dir"] . '/attach/lib/FileAPI.class.php';
    include_once $cfg["plugins_dir"] . '/attach/lib/SimpleImage.php';

    list($w, $h) = explode("x", $size);

    switch ($type) {
        default :
        case "b":
            $img = new abeautifulsite\SimpleImage($image);
            return $img->thumbnail($w, $h)->output_base64();
            break;
        case "f":
            $udir = "datas/cache/thumbs/{$size}/";
            if (!file_exists($udir . basename($image))) {
                if (!is_dir($udir)) {
                    mkdir($udir, 0755, true);
                    $file = $udir . ".htaccess";
                    file_put_contents($file, "allow from all");
                }

                $img = new abeautifulsite\SimpleImage($image);
                $t = $img->thumbnail($w, $h)->save($udir . basename($image));
            }
            return $udir . basename($image);
            break;
    }
}

function cot_attach_save($id) {

    global $db_attach, $db;
    $data = cot_import("attach", "P", "ARR");
    $script = $_SERVER["SCRIPT_NAME"];
    $x = cot_import("x", "P", "TXT");

    if ($script == "/admin.php") {
        $e = cot_import("m", "G", "TXT");
    } else {
        $e = cot_import("e", "G", "TXT");
    }

    $rr = $db->query("UPDATE `{$db_attach}` SET `att_code` = '{$id}', att_x='' WHERE `att_extension` = '{$e}' && `att_x` = '{$x}' ");
}

function cot_attach_delete() {
    global $db_attach, $db, $id;
    $data = cot_import("attach", "P", "ARR");
    $script = $_SERVER["SCRIPT_NAME"];

    if ($script == "/admin.php") {
        $e = cot_import("m", "G", "TXT");
    } else {
        $e = cot_import("e", "G", "TXT");
    }

    $where["save"] = "att_code='{$id}' && att_extension='{$e}'";
    $where_on = "WHERE " . implode(" AND ", $where);
    $files = $db->query("SELECT * FROM {$db_attach} {$where_on} ")->fetchAll();

    foreach ($files as $file) {
        unlink($file["att_filepath"] . "/" . $file["att_filename"]);
        $where["delete"] = "att_id='{$file["att_id"]}'";
        $db->delete($db_attach, "{$where["delete"]}");
    }
}
