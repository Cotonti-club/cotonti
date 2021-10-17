<?php

defined('COT_CODE') or die('Wrong URL.');

class Vue
{
    private $vueErrors = [];

    public function __construct()
    {
        Resources::linkFileFooter("plugins/vuejs/assets/js/vue.min.js", "js");
    }

    public function __destruct()
    {
        foreach ($this->vueErrors as $error){
            cot_message($error, "error");
        }
    }

    public function add($file, $css = false)
    {
        if ($file)
            if (file_exists("plugins/vuejs/assets/js/{$file}.min.js")) {
                Resources::linkFileFooter("plugins/vuejs/assets/js/{$file}.min.js", "js");
            } else {
                if (!$this->vueErrors[$file]) {
                    $this->vueErrors[$file] = "File not found:  plugins/vuejs/assets/js/{$file}.min.js";
                }
            }
        if ($css)
            if (file_exists("plugins/vuejs/assets/css/{$file}.min.css")) {
                Resources::linkFile("plugins/vuejs/assets/css/{$file}.min.css", "css");
            } else {
                if (!$this->vueErrors[$file]) {
                    $this->vueErrors[$file] = "File not found:  plugins/vuejs/assets/css/{$file}.min.css";
                }
            }
    }


}
