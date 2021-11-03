<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=ajax
[END_COT_EXT]
==================== */
defined('COT_CODE') or die('Wrong URL');

$mode = cot_import("m", "G", "TXT");

if($mode == "uploadFile"){
    $target_dir = "datas/uploads/";
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            print  json_encode([
                "success" => 1,
                "file" => [
                    "url" => "/datas/uploads/" . basename($_FILES["image"]["name"])
                ]
            ]);
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
}elseif ($mode == "fetchUrl"){

}