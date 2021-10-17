<?php
defined('COT_CODE') or die('Wrong URL');


function cot_apply_rwr($args, $rule)
{
    if (isset($rule["params"])) {
        $params = $rule["params"];
        $arr = explode("&", $params);
        foreach ($arr as $str) {
            if (strlen($str)) {
                list($k, $v) = explode("=", $str);
                $args[$k] = $v;
                $_GET[$k] = $v;
            }
        }
    }
    if (isset($args["c"])) {
        $cat = $args["c"];
        if (isset($rule["start_at"])) {
            $cat = $rule["start_at"] . '/' . $args["c"];
        }
    } elseif (isset($rule["start_at"])) {
        $cat = $rule["start_at"];
    }
    if (isset($cat)) {
        $cat_item = array_filter(cot::$structure[$rule["module"]], function ($item) use ($cat) {
            return $item["path"] == str_replace("/", ".", $cat);;
        });
        if ($cat_item) {
            $cat_keys = is_array($cat_item) ? array_keys($cat_item) : [];
            $cat_last = end($cat_keys);
            if ($cat_last) {
                $args['c'] = $cat_last;
            }
        } else {
            $_GET['e'] = 404;
        }
    }

    if (!isset($_GET['e'])) $_GET['e'] = $rule["module"];
    $_GET = array_merge($_GET, $args);


}

function cot_url_custom($name, $params = [])
{
    global $rules;
    $params_keys = array_keys($params);
    $q_s = str_replace('%5B', '[', str_replace('%5D', ']', http_build_query($params)));

    $re = '`(/|\.|)\[([^:\]]*+)(?::([^:\]]*+))?\](\?|)`m';

    $arr = array_filter($rules, function ($el) use ($name) {
        return $el["module"] === $name;
    });
    $urls = [];

    // find actual url
    foreach ($arr as $item) {
        if (!empty($item["params"])) {
            $p = cot_explode_url_params($item["params"]);
            $c = 0;
            foreach ($p as $k => $v) {
                if (isset($params[$k]) && $params[$k] == $v) {
                    $c++;
                    unset($params[$k]);
                }
            }
            if ($c > 0) {
                $urls[] = $item["pattern"];
            }
        } else {
            preg_match_all($re, $item["pattern"], $matches, PREG_PATTERN_ORDER, 0);

            $found = 0;
            foreach ($matches[3] as $match) {
                if (!in_array($match, $params_keys)) continue;
                if ($name == 'page') {
//                    cot_print_r([in_array($match, $params_keys), $match, $params_keys]);
                }
                if (!empty($params[$match])) {
                    $found++;
                }
            }
            if ($found == count($matches[3])) {
                $urls[$found] = $item["pattern"];
            }
        }

    }

    // Replace named parameters
    $route = end($urls);

    // prepend base path to route url again
    $url = $route;


    if (preg_match_all($re, $route, $matches, PREG_SET_ORDER)) {
        foreach ($matches as $index => $match) {
            list($block, $pre, $type, $param, $optional) = $match;

            if ($pre) {
                $block = substr($block, 1);
            }
            if (isset($params[$param])) {
                // Part is found, replace for param value
                $url = str_replace($block, $params[$param], $url);
            } elseif ($optional && $index !== 0) {
                // Only strip preceding slash if it's not at the base
                $url = str_replace($pre . $block, '', $url);
            } else {
                // Strip match block
                $url = str_replace($block, '', $url);
            }
            unset($params[$param]);
        }
    }
    if (!$url) {
        $url = $name;
    }
    if (count($params))
        $url .= '?' . http_build_query($params);

    return $url;
}


function cot_explode_url_params($params)
{
    $items = [];
    $list = explode('&', $params);
    if ($list)
        foreach ($list as $str) {
            list($k, $v) = explode('=', $str);
            $items[$k] = $v;
        }

    return $items;
}
