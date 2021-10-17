<?php


return [
    // forums
    [
        "module" => "forums",
        "pattern" => "forums",
        "params" => "",
    ],
    [
        "module" => "forums",
        "pattern" => "forums/[a:m]",
        "params" => "",
    ],
    [
        "module" => "forums",
        "pattern" => "forums/[a:m]/[a:s]",
        "params" => "",
    ],

    // news
    ["module" => "page", "pattern" => "edit-news/id[i:id]", "params" => "m=edit"], // Редактировать новость
    ["module" => "page", "pattern" => "[*:c]"], // все новости
    ["module" => "page", "pattern" => "[**:c]/id[i:id]"], // новость по айди
    ["module" => "page", "pattern" => "[**:c]/[a:al]"], // новость по альясу
//    ["module" => "page", "pattern" => "add-news", "params" => "m=add&c=news"], // создать новость
//    ["module" => "page", "start_at" => "news", "pattern" => "news/[*:c]"], // категории новостей

    // users
    [
        "module" => "users",
        "pattern" => "users",
        "params" => ""
    ],
    [
        "module" => "users",
        "pattern" => "user/[a:u]",
        "params" => "m=details"
    ],
];
