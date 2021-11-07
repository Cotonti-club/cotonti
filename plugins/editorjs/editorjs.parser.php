<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=parser
[END_COT_EXT]
==================== */
defined('COT_CODE') or die('Wrong URL');


function cot_parse_editorjs($content)
{
    $blocks = json_decode($content, 1);
    if (isset($blocks["blocks"])) {
        $result = '';
        foreach ($blocks["blocks"] as $block) {
            switch ($block["type"]) {
                case 'paragraph':
                    $result .= "<p>{$block["data"]["text"]}</p>";
                    break;
                case 'header':
                    $result .= "<h{$block["data"]["level"]}>{$block["data"]["text"]}</h{$block["data"]["level"]}>";
                    break;
                case 'list':
                    $result .= $block["data"]["style"] == "unordered" ? "<ul>" : "<ol>";
                    foreach ($block["data"]["items"] as $item) {
                        $result .= "<li>{$item}</li>";
                    }
                    $result .= $block["data"]["style"] == "unordered" ? "</ul>" : "</ol>";
                    break;
                case 'image':
                    if ($block["data"]["stretched"]) {
                        $width = "width='100%'";
                    }
                    if ($block["data"]["withBorder"]) {
                        $border = "border='5'";
                    }
                    if ($block["data"]["withBackground"]) {
                        $result .= "<div class='uk-text-center page-image-backgound'><img src='{$block["data"]["file"]["url"]}' alt='{$block["data"]["caption"]}' {$border} {$width}></div>";
                    } else {
                        $result .= "<img src='{$block["data"]["file"]["url"]}' alt='{$block["data"]["caption"]}' {$border} {$width}>";
                    }
                    break;
                case 'delimiter':
                    $result .= "<hr/>";
                    break;
                case 'quote':
                    $result .= "<blockquote><p class='uk-margin-small-bottom'>{$block["data"]["text"]}</p><footer>{$block["data"]["caption"]}</footer></blockquote>";
                    break;
                case 'warning':
                    $result .= "<div class='uk-alert uk-alert-warning'><a class='uk-alert-close' uk-close></a><strong>{$block["data"]["title"]}</strong><div>{$block["data"]["message"]}</div></div>";
                    break;
                case 'alert':
                    $result .= "<div class='uk-alert uk-alert-{$block["data"]["type"]}'><a class='uk-alert-close' uk-close></a><div>{$block["data"]["message"]}</div></div>";
                    break;
                case 'code':
                    $result .= "<pre><code data-language='html'>";
                    $result .= htmlspecialchars($block["data"]["code"]);
                    $result .= "</code></pre>";
                    break;
                case 'raw':
                    $result .= $block["data"]["html"];
                    break;
                case 'table':
                    $result .= "<div class='uk-overflow-auto'><table class='table'>";
                    foreach ($block["data"]["content"] as $tr) {
                        $result .= "<tr>";
                        foreach ($tr as $td) {
                            $result .= "<td>{$td}</td>";
                        }
                        $result .= "</tr>";
                    }
                    $result .= "</table></div>";
                    break;
//                default:
//                    vd($block);
//                    break;
            }
        }
        return $result;
    }elseif (is_array($content) && count($content)){
        return $content;
    }
}
