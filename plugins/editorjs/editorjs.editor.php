<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=global
[END_COT_EXT]
==================== */
defined('COT_CODE') or die('Wrong URL');

include_once cot_incfile("editorjs", "plug");

if(defined('COT_ADMIN')){
    @$isEditor = $m && $cfg[$m] && $cfg[$m]["parser"] == "editorjs";
}else{
    @$isEditor = $e && $cfg[$e] && in_array($m, ["edit", "add"]) && $cfg[$e]["parser"] == "editorjs";
}


if($isEditor){
    $R["input_textarea_editor"] = '<textarea name="{$name}" editorjs hidden>{$value}</textarea><div id="editorjs"></div>';
    $R["input_textarea_medieditor"] = '<textarea name="{$name}" editorjs hidden>{$value}</textarea><div id="editorjs"></div>';

    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/header@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/image@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/delimiter@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/list@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/quote@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/embed@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/table@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/warning@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/marker@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/inline-code@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/raw@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/code@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest');
    Resources::linkFileFooter('https://cdn.jsdelivr.net/npm/@editorjs/underline@latest');
    Resources::linkFileFooter('plugins/editorjs/js/editorjs.js');
    Resources::addFile('plugins/editorjs/css/editorjs.css');
}
