<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=input
 * [END_COT_EXT]
 */

$r = cot_import("r", "G", "TXT");
if($r == "editorjs"){
    define('COT_NO_ANTIXSS', TRUE) ;
    $cfg['referercheck'] = false;
}