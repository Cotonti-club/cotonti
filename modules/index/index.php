<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=module
[END_COT_EXT]
==================== */

/**
 * Home page main code
 *
 * @package Index
 * @copyright (c) Cotonti Team
 * @license https://github.com/Cotonti/Cotonti/blob/master/License.txt
 */

defined('COT_CODE') or die('Wrong URL.');

// Environment
define('COT_INDEX', true);
$env['location'] = 'home';


/* === Hook === */
foreach (cot_getextplugins('index.first') as $pl) {
    include $pl;
}
/* ===== */

list($usr['auth_read'], $usr['auth_write'], $usr['isadmin']) = cot_auth('index', 'a');
cot_block($usr['auth_read']);

/* === Hook === */
foreach (cot_getextplugins('index.main') as $pl) {
    include $pl;
}
/* ===== */

if ($_SERVER['REQUEST_URI'] == COT_SITE_URI . 'index.php') {
    $sys['canonical_url'] = COT_ABSOLUTE_URL;
}

require_once $cfg['system_dir'] . '/header.php';

$t = new XTemplate(cot_tplfile('index'));


$file = "{$cfg['themes_dir']}/{$cfg['defaulttheme']}/{$cfg['defaulttheme']}.index.cfg.php";
if (file_exists($file)) {
    $conf = include_once $file;
}

if (!empty($cfg["index"]["json"])) {
    $current_conf = json_decode($cfg["index"]["json"], 1);
}


if ($conf)
    foreach ($conf as $key => $item) {
        if ($item["values"])
            foreach ($item["values"] as $k => $value) {
                $t->assign("INDEX_" . strtoupper($key) . "_" . strtoupper($k), $current_conf[$key]["values"][$k]["value"] ?: $value["default"]);
            }
    }

/* === Hook === */
foreach (cot_getextplugins('index.tags') as $pl) {
    include $pl;
}
/* ===== */

$t->parse('MAIN');
$t->out('MAIN');

require_once $cfg['system_dir'] . '/footer.php';

if ($cache && $usr['id'] === 0 && $cfg['cache_index']) {
    $cache->page->write();
}
