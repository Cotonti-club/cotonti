<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=admin.home.toppanel
[END_COT_EXT]
==================== */

/**
 * Pages manager & Queue of pages
 *
 * @package Cotonti
 * @copyright (c) Cotonti Team
 * @license https://github.com/Cotonti/Cotonti/blob/master/License.txt
 */
defined('COT_CODE') or die('Wrong URL');

$tt = new XTemplate(cot_tplfile('page.admin.home', 'module', true));

require_once cot_incfile('page', 'module');

	$pagesQueued = $db->query("SELECT COUNT(*) FROM $db_pages WHERE page_state='1'")->fetchColumn();
	$pagesPublished = $db->query("SELECT COUNT(*) FROM $db_pages WHERE page_state='0'")->fetchColumn();
	$tt->assign(array(
		'ADMIN_HOME_URL' => cot_url('admin', 'm=page'),
		'ADMIN_HOME_PAGESQUEUED' => $pagesQueued,
		'ADMIN_HOME_PAGESPUBLISHED' => $pagesPublished
	));

$tt->parse('MAIN');

$line = $tt->text('MAIN');
