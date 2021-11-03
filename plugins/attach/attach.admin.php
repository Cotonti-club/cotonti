<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=admin.config.edit.loop
  [END_COT_EXT]
  ==================== */

defined('COT_CODE') or die('Wrong URL');

require_once cot_incfile('page', 'module');
$adminhelp = $L['news_help'];



if ($p == 'attach' && $row['config_name'] == 'set') {
    $sskin = cot_tplfile('attach.admin', 'plug', true);
    $tt = new XTemplate($sskin);

    $tpaset = str_replace("\r\n", "\n", $row['config_value']);
    $tpaset = array_filter(explode("\n", $tpaset));
    $jj = 0;
    
    if(!empty($tpaset)) {
        foreach ($tpaset as $k => $v) {
            $v = explode('|', $v);
            $v = array_map('trim', $v);
            $jj++;
            $tt->assign(array(
                'ADDNUM' => $jj,
                'ADDMODULE' => $v[0],
                'ADDCATEGORY' => $v[1],
                'ADDPATH' => $v[2],
                'ADDREQ' => $v[3],
                'ADDEXT' => $v[4],
                'ADDMAX' => $v[5],
            ));
            $tt->parse('MAIN.ADDITIONAL');
        }
    }

    $jj++;
    $tt->assign(array(
        'CATNUM' => $jj
    ));
    $tt->parse('MAIN');

    $t->assign(array(
        'ADMIN_CONFIG_ROW_CONFIG_MORE' => $tt->text('MAIN') . '<div id="helptext">' . $hint . '</div>'
    ));
}