<?php

/**
 * [BEGIN_COT_EXT]
 * Hooks=page.add.add.done,page.edit.update.done,projects.add.add.done,projects.edit.update.done,catalog.add.add.done,catalog.edit.update.done,portfolio.add.add.done,portfolio.edit.update.done
 * [END_COT_EXT]
 */
defined('COT_CODE') or die('Wrong URL');

include_once cot_incfile("attach", "plug");


$id = $id ? $id : cot_import("id", "G", "TXT");


cot_attach_save($id);
