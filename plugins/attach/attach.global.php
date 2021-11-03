<?php

defined('COT_CODE') or die('Wrong URL.');
/* ====================
  [BEGIN_COT_EXT]
  Hooks=input
  [END_COT_EXT]
  ==================== */

// Attachments API is available everywhere

require_once cot_incfile('attach', 'plug');
if (file_exists(cot_langfile('attach', 'plug')))
    require_once cot_langfile('attach', 'plug', 'ru');


