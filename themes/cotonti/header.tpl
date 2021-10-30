<!-- BEGIN: HEADER -->
<!DOCTYPE HTML>
<head>
    <title>{HEADER_TITLE}</title>
    <!-- IF {HEADER_META_DESCRIPTION} -->
    <meta name="description" content="{HEADER_META_DESCRIPTION}"/>
    <!-- ENDIF -->
    <!-- IF {HEADER_META_KEYWORDS} -->
    <meta name="keywords" content="{HEADER_META_KEYWORDS}"/>
    <!-- ENDIF -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="{HEADER_META_CONTENTTYPE}; charset=UTF-8"/>
    <meta name="generator" content="Cotonti http://www.cotonti.club"/>
    <link rel="canonical" href="{HEADER_CANONICAL_URL}"/>
    {HEADER_BASEHREF}
    {HEADER_HEAD}
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="apple-touch-icon" href="apple-touch-icon.png"/>
</head>
<body>
<section class="appbar">
    <div class="container">
        <div class="row align-items-center h-100">
            <div class="col">
                <div class="d-flex">
                    <div class="me-3">
                        <a href="{PHP.cfg.mainurl}" class="btn btn-sm btn-appbar"><i data-feather="home"></i></a>
                    </div>
                    <!-- IF {PHP.cot_plugins_active.search} -->
                    <div>
                        <form action="{PHP|cot_url('plug','e=search')}" method="post">
                            <div class="input-group">
                                <input class="search-input" type="text" name="sq" autocomplete="off"
                                       value="{PHP.L.Search}..."
                                       onblur="if(this.value=='') this.value='{PHP.L.Search}...';"
                                       onfocus="if(this.value=='{PHP.L.Search}...') this.value='';">
                                <button class="btn btn-sm btn-primary" type="submit">
                                    <i data-feather="search" title="{__(Search)}"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    <!-- ENDIF -->
                    <!-- BEGIN: I18N_LANG -->
                        <div class="ms-3">
                            <!-- BEGIN: I18N_LANG_ROW -->
                            <a href="{I18N_LANG_ROW_URL}" class="{I18N_LANG_ROW_CLASS} btn btn-appbar px-1"><img src="images/flags/{I18N_LANG_ROW_FLAG}.png"/></a>
                            <!-- END: I18N_LANG_ROW -->
                        </div>
                    <!-- END: I18N_LANG -->
                </div>
            </div>
            <div class="col text-end">
                <!-- BEGIN: GUEST -->
                <div class="d-flex justify-content-end">
                    <div class="dropdown">
                        <a class="btn btn-sm btn-appbar" href="#" role="button" id="auth" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            {__('aut_logintitle')}
                        </a>

                        <div class="dropdown-menu dropdown-menu-end dropdown-login" aria-labelledby="auth">
                            <form class="px-4 py-3">
                                <div class="mb-3">
                                    <label for="username" class="form-label">{__('users_nameormail')}</label>
                                    <input type="text" class="form-control" id="username" name="rusername">
                                </div>
                                <div class="mb-3">
                                    <label for="Password" class="form-label">{__('Password')}</label>
                                    <input type="password" class="form-control" id="Password" name="rpassword">
                                </div>
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="remember">
                                        <label class="form-check-label" for="remember" name="rremember">
                                            {__('users_rememberme')}
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-sm btn-primary">{__('Login')}</button>
                                    </div>
                                    <div class="col-auto text-end">
                                        <a href="{PHP|cot_url('users','m=passrecover')}" class="btn btn-sm btn-link">
                                            {__('users_lostpass')}
                                        </a>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                    <div>
                        <a href="{PHP|cot_url('users','m=register')}"
                           class="btn btn-sm btn-warning">{__('Register')}</a>
                    </div>
                </div>
                <!-- END: GUEST -->
                <!-- BEGIN: USER -->
                <div class="d-flex justify-content-end">
                    <div class="dropdown">
                        <a class="btn btn-sm btn-appbar" href="#" role="button" id="usemenu" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            {PHP.usr.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="usemenu">
                            <li class="dropdown-header">
                               <div class="row align-items-center">
                                   <div class="col-auto">
                                       <!-- IF {PHP.usr.profile.user_avatar} -->
                                       <img src="{PHP.usr.profile.user_avatar}" alt="{PHP.L.Avatar}" width="42" class="bg-info rounded-circle"/>
                                       <!-- ELSE -->
                                       <img src="datas/defaultav/blank.png" alt="{PHP.L.Avatar}" width="42" class="bg-info rounded-circle"/>
                                       <!-- ENDIF -->
                                   </div>
                                   <div class="col">
                                       <h5 class="mb-0 text-body">{PHP.usr.name}</h5>
                                       <div class="text-muted">{PHP.usr.maingrp|cot_build_group($this, false, false)}</div>
                                   </div>
                               </div>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <!-- IF {PHP.usr.isadmin} -->
                            <li>
                                <a href="{PHP|cot_url('admin')}" class="dropdown-item" >
                                    <i data-feather="git-commit" class="me-1"></i>
                                    {__('Adminpanel')}
                                </a>
                            </li>
                            <!-- ENDIF -->
                            <!-- IF {PHP.out.notices} -->
                            <li>{PHP.out.notices}</li>
                            <!-- ENDIF -->
                            <li>
                                <a href="{PHP|cot_url('users','m=profile')}" class="dropdown-item">
                                    <i data-feather="settings" class="me-1"></i>
                                    {__('Profile')}
                                </a>
                            </li>
                            <!-- IF {PHP.cot_modules.pm} -->
                            <li>
                                <a href="{PHP|cot_url('pm')}" class="dropdown-item">
                                    <i data-feather="mail" class="me-1"></i>
                                    {__('Private_messages')}
                                </a>
                            </li>
                            <!-- ENDIF -->
                            <li>
                                <a href="{PHP.out.loginout_url}" class="dropdown-item">
                                    <i data-feather="log-out" class="me-1"></i>
                                    {__('Logout')}
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END: USER -->
            </div>
        </div>
    </div>
</section>
<header class="header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-3 col-xl-3 col-xxl-2">
                <div class="logo">
                    <a href="{PHP.cfg.mainurl}">
                        <span>
                            Cotonti.club / Open Source PHP Content Management Framework
                        </span>
                    </a>
                    <div>
                        <small>Content Management Framework</small>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-xl-9 col-xxl-10">
                <nav class="navbar navbar-expand-lg pb-0">
                    <div class="container-fluid justify-content-end">
                        <button class="navbar-toggler text-light" type="button" data-bs-toggle="collapse"
                                data-bs-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <i data-feather="menu"></i>
                        </button>
                        <div class="collapse navbar-collapse justify-content-center" id="mainMenu">
                            <ul class="nav nav-tabs">
                                <li class="nav-item dropdown">
                                    <a class="nav-link active" href="{PHP.cfg.mainurl}" data-bs-toggle="dropdown"
                                       role="button" aria-expanded="false">
                                        {__(Home)}
                                        <small class="d-block">Новости и события</small>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a class="dropdown-item"
                                               href="{PHP|cot_url('page','c=news')}">{__(News)}</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">Преимущества</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button"
                                       aria-expanded="false">
                                        {__('Files')}
                                        <small class="d-block">Обновите и настройте</small>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Основные файлы</a></li>
                                        <li><a class="dropdown-item" href="#">Темы</a></li>
                                        <li><a class="dropdown-item" href="#">Модули/Плагины</a></li>
                                        <li><a class="dropdown-item" href="#">Локализации</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button"
                                       aria-expanded="false">
                                        Документация
                                        <small class="d-block">Детальная информация</small>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" data-bs-toggle="dropdown" href="#" role="button"
                                       aria-expanded="false">
                                        Сообщество
                                        <small class="d-block">Участвуйте</small>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <!-- IF {PHP.cot_modules.forums} -->
                                        <li><a class="dropdown-item" href="{PHP|cot_url('forums')}">{__('Forums')}</a>
                                        </li>
                                        <!-- ENDIF -->
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<div class="main container">
<!-- END: HEADER -->
