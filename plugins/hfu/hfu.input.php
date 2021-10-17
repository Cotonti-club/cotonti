<?php
/* ====================
[BEGIN_COT_EXT]
Hooks=input
Order=5
[END_COT_EXT]
==================== */

defined('COT_CODE') or die('Wrong URL');
require_once cot_incfile('hfu', 'plug');
require_once cot_incfile('hfu', 'plug', 'router');

//$rules = json_decode($cfg["plugin"]["hfu"]["rules"], 1);
$rules = require_once './datas/urls.php';

$router = new Router();
$rwr = cot_import('rwr', "G", "TXT");

$rules[] = [
    "module" => "index",
    "pattern" => '/',
];
//cot_print_r($rules);

foreach ($rules as $rule) {
    $myRules[] = $rule["module"];
    $myRules[] = $rule["module"] . '/[a:m]';
}

/** @var MODULES $cot_modules */
$modules_rules = $cot_modules;
$modules_rules["admin"] = ["code" => "admin"];
foreach ($modules_rules as $cot_module) {
    if (in_array($cot_module["code"], $myRules)) {
        continue;
    }
    $rules[] = [
        "module" => $cot_module["code"],
        "pattern" => $cot_module["code"],
    ];
    $rules[] = [
        "module" => $cot_module["code"],
        "pattern" => $cot_module["code"] . '/[a:m]',
    ];
}

$routes = [];
$cot_urltrans = [];
$re = '`(/|\.|)\[([^:\]]*+)(?::([^:\]]*+))?\](\?|)`m';

foreach ($rules as $rule) {
    $routes[] = $rule["pattern"];
    $cot_urltrans[$rule["module"]][] = $rule["pattern"];
    preg_match_all($re, $rule["pattern"], $matches, PREG_PATTERN_ORDER, 0);
    $rule["name"] = $rule['module'] . ':' .md5($rule['pattern']);
    $router->map(isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : 'GET', $rule["pattern"], 'cot_apply_rwr', $rule["name"]);
}

// match current request url
$match = $router->match($rwr);

// call closure or throw 404 status
if (is_array($match) && is_callable($match['target'])) {
    call_user_func_array( $match['target'], [$match['params'], $match['rule']] );
} elseif(empty($_GET["e"])) {
    // no route was matched
   $_GET["e"] = 404;
}

//cot_print_r($match, $routes);