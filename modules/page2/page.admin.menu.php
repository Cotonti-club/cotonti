<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=admin.menu.before
 * [END_COT_EXT]
 */

defined('COT_CODE') or die('Wrong URL.');
if (defined('COT_ADMIN')) {
    $isadmin = cot_auth('page', 'any', 'A');
    if ($isadmin) {
        $db_pages = cot::$db_x . 'pages';
        $current_state = cot_import("state", "G", "INT");
        $current_filter = cot_import("filter", "G", "TXT");
        $current_n = cot_import("n", "G", "TXT");

        $page_moderated = $db->query("SELECT COUNT(*) FROM {$db_pages} WHERE page_state=1")->fetchColumn();
        if ($page_moderated > 9) $page_moderated = "9+";
        $page_hidden = $db->query("SELECT COUNT(*) FROM {$db_pages} WHERE page_state=2")->fetchColumn();
        if ($page_hidden > 9) $page_hidden = "9+";


        $menu["page"] = [
            "title" => $L['Pages'] ?: 'Pages',
            "icon" => 'bi bi-file',
            "url" => "/admin.php?m=page",
            "active" => ($current_module == "page") || ($current_module == "config" && $current_page == "page") || ($current_module == "structure" && $current_n == "page"),
            "items" => [
                [
                    "title" => $L['adm_showall'],
                    "url" => cot_url("admin", "m=page"),
                    "active" => $current_module == "page" && !$current_page && !$current_filter  && !$current_n || (isset($_GET["search"]) && $current_state != 2),
                ],
                [
                    "title" => isset($L['page_addtitle']) ? $L['page_addtitle'] : 'Create',
                    "url" => cot_url("admin", "m=page&p=add"),
                    "active" => $current_module == "page" && $current_page == 'add',
                ],
                [
                    "title" => isset($L['page_status_moderated']) ? $L['page_status_moderated'] : 'On moderation',
                    "count" => $page_moderated,
                    "url" => cot_url("admin", "m=page&filter=valqueue"),
                    "active" => $current_module == "page" && $current_filter == 'valqueue',
                ],
                [
                    "title" => isset($L['page_drafts']) ? $L['page_drafts'] : 'Drafts',
                    "count" => $page_hidden,
                    "url" => cot_url("admin", "m=page&filter=drafts"),
                    "active" => $current_module == "page" && $current_filter == 'drafts',
                ],
                [
                    "title" => $L['Settings'],
                    "url" =>  cot_url("admin", "m=config&n=edit&o=module&p=page"),
                    "active" => $current_module == "config" && $current_page == "page",
                ],
                [
                    "title" => $L['Structure'],
                    "url" => cot_url("admin", "m=structure&n=page"),
                    "active" => $current_module == "structure" && $current_n == "page",
                ],
                [
                    "title" => $L['adm_extrafields'],
                    "url" => cot_url('admin','m=page&n=extrafields'),
                    "active" => $current_module == "page" && $current_n == "extrafields",
                ],
            ]
        ];
    }

}