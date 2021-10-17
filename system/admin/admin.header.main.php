<?php
defined('COT_CODE') or die('Wrong URL.');
list($admin_read, $admin_write, $isadmin) = cot_auth('admin', 'a');

$current_module = cot_import("m", "G", "TXT");
$current_page = cot_import("p", "G", "TXT");
$current_subpage = cot_import("s", "G", "TXT");
$current_n = cot_import("n", "G", "TXT");
$current_o = cot_import("o", "G", "TXT");


$menu = [];


/* === Hook === */
foreach (cot_getextplugins('admin.menu.before') as $pl) {
    include $pl;
}
/* ===== */

asort($menu);
if ($admin_read) {
    if ($usr["admin_config"]) {
        $menu["extensions"] = [
            "title" => $L['Extensions'],
            "icon" => 'bi-cpu',
            "url" => "/admin.php?m=extensions",
            "active" => $current_module == "extensions",
        ];
    }
    if ($usr["admin_config"]) {
        $menu["settings_core"] = [
            "title" => $L['home_ql_b1_title'],
            "icon" => 'bi-gear',
            "url" => cot_url("admin", "m=config"),
            "active" => $current_module == "config" && $current_o == 'core',
            "items" => [
                [
                    "title" => $L['Locale'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=locale"),
                    "active" => $current_module == "config" && $current_page == "locale",
                ],
                [
                    "title" => $L['core_main'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=main"),
                    "active" => $current_module == "config" && $current_page == "main",
                ],
                [
                    "title" => $L['core_menus'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=menus"),
                    "active" => $current_module == "config" && $current_page == "menus",
                ],
                [
                    "title" => $L['core_performance'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=performance"),
                    "active" => $current_module == "config" && $current_page == "performance",
                ],
                [
                    "title" => $L['Security'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=security"),
                    "active" => $current_module == "config" && $current_page == "security",
                ],
                [
                    "title" => $L['core_sessions'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=sessions"),
                    "active" => $current_module == "config" && $current_page == "sessions",
                ],
                [
                    "title" => $L['core_theme'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=theme"),
                    "active" => $current_module == "config" && $current_page == "theme",
                ],
                [
                    "title" => $L['core_title'],
                    "url" => cot_url("admin", "m=config&n=edit&o=core&p=title"),
                    "active" => $current_module == "config" && $current_page == "title",
                ],
            ]
        ];
        $menu["settings_plugins"] = [
            "title" => @$L['adm_plugins_settings'],
            "icon" => 'bi-gear',
            "url" => cot_url("admin", "m=config"),
            "active" => $current_module == "config" && $current_o == 'plug',
            "items" => [
            ]
        ];
    }
    if (!defined("COT_CONFIG_TYPE_HIDDEN")) {
        define("COT_CONFIG_TYPE_HIDDEN", 5);
    }
    $plugins_conf = $db->query("
			SELECT DISTINCT(c.config_cat), r.ct_title FROM $db_config AS c
				LEFT JOIN $db_core AS r ON c.config_cat = r.ct_code
			WHERE config_owner = 'plug'
			AND config_type != '" . COT_CONFIG_TYPE_HIDDEN . "'
			ORDER BY config_cat ASC
		")->fetchAll();
    foreach ($plugins_conf as $plugin) {
        $menu["settings_plugins"]["items"][] = [
            "title" => $plugin["ct_title"],
            "url" => cot_url('admin', "m=config&n=edit&o=plug&p={$plugin["config_cat"]}"),
            "active" => $current_module == "config" && $current_o == 'plug' && $current_page == $plugin["config_cat"],
        ];
    }

    $menu["other"] = [
        "title" => $L['Other'],
        "icon" => 'bi-columns-gap',
        "url" => "/admin.php?m=other",
        "active" => ($current_module == "other" && !$current_page) || $current_module == "cache" || ($current_module == "extrafields" && !$current_n) || $current_module == "log" || $current_module == "infos",
        "items" => [
            [
                "title" => $L['adm_internalcache'],
                "url" => "/admin.php?m=cache",
                "active" => $current_module == "cache" && !$current_subpage,
            ],
            [
                "title" => $L['adm_diskcache'],
                "url" => "/admin.php?m=cache&s=disk",
                "active" => $current_module == "cache" && $current_subpage == "disk",
            ],
            [
                "title" => $L['adm_log'],
                "url" => "/admin.php?m=log",
                "active" => $current_module == "log",
            ],
            [
                "title" => $L['adm_infos'],
                "url" => "/admin.php?m=infos",
                "active" => $current_module == "infos"
            ],
        ]
    ];

}

/* === Hook === */
foreach (cot_getextplugins('admin.menu.after') as $pl) {
    include $pl;
}
/* ===== */

if ($menu) {
    foreach ($menu as $k => $v) {

        if (isset($v["items"]) && count($v["items"])) {
            foreach ($v["items"] as $item) {
                $t->assign([
                    "MENU_ITEM_TITLE" => @$item["title"],
                    "MENU_ITEM_COUNT" => @$item["count"],
                    "MENU_ITEM_URL" => @$item["url"],
                    "MENU_ITEM_ACTIVE" => @$item["active"],
                ]);

                $t->parse('HEADER.MENU.ITEMS');
                $t->parse('HEADER.MOBILE_MENU.ITEMS');
            }
            $t->assign("MENU_ITEMS", count(@$v["items"]));
        } else {
            $t->assign("MENU_ITEMS", 0);
        }
        $t->assign([
            "MENU_KEY" => $k,
            "MENU_TITLE" => @$v["title"],
            "MENU_URL" => @$v["url"],
            "MENU_ICON" => @$v["icon"],
            "MENU_COUNT" => @$v["count"],
            "MENU_ACTIVE" => @$v["active"],
        ]);
        $t->parse('HEADER.MENU');
    }
}

