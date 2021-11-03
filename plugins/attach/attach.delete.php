<?php
/**
 * [BEGIN_COT_EXT]
 * Hooks=page.edit.delete.done, market.edit.delete.done, projects.edit.delete.done
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL');

include_once cot_incfile("attach", "plug");

cot_attach_delete();