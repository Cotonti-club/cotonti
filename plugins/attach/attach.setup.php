<?php defined('COT_CODE') or die('Wrong URL');
/* ====================
Copyright (c) 2010-2015, Kolev Andrew, alteraweb.ru.
All rights reserved. Distributed under BSD License.

[BEGIN_COT_EXT]
Code=attach
Name=Attachments
Category=files-media
Description=Загрузка, вывод файлов.
Version=2.0.4
Date=15.01.21
Author=Attar
Copyright=(c) Kolev Andrew, pluginspro.ru, 2015-2021
Notes=НЕ ЗАБУДЬТЕ создать доступную для записи папку для вложений
SQL=
Auth_guests=R1
Lock_guests=2345A
Auth_members=RW1
Lock_members=2345
[END_COT_EXT]

[BEGIN_COT_EXT_CONFIG]
tinypng=01:radio::0:TynyPng
tinypngKey=02:string:::TynyPng API KEY
tinyMAX=03:string::500:Лимит оптимизаций в мес.
w=04:string::200:Ширина превьюшки
h=05:string::200:Высота превьюшки
set=99:textarea::
[END_COT_EXT_CONFIG]

==================== */
