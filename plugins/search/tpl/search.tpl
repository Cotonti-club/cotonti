<!-- BEGIN: MAIN -->
<h2 class="stats">{PLUGIN_TITLE}</h2>
{FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}

<form id="search" name="search" action="{PLUGIN_SEARCH_ACTION}" method="get">
    <input type="hidden" name="e" value="search"/>
    <input type="hidden" name="tab" value="{PHP.tab}"/>
    <div class="mb-2">
        <div class="input-group mb-3">
            {PLUGIN_SEARCH_TEXT}
            <button type="submit" class="btn btn-primary">{__('plu_search_key')}</button>
        </div>
    </div>

    <ul class="nav nav-tabs position-relative">
        <li class="nav-item">
            <a class="nav-link <!-- IF !{PHP.tab} -->active<!-- ENDIF -->"
               href="{PHP.sq|cot_url('plug','e=search&sq=$this')}">{__('plu_tabs_all')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <!-- IF {PHP.tab} == 'pag' -->active<!-- ENDIF -->"
               href="{PHP.sq|cot_url('plug','e=search&amp;tab=pag&sq=$this')}">{__('Pages')}</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <!-- IF {PHP.tab} == 'frm' -->active<!-- ENDIF -->"
               href="{PHP.sq|cot_url('plug','e=search&amp;tab=frm&sq=$this')}">{__('Forums')}</a>
        </li>
        <li class="position-absolute" style="right: 0">
            <a class="btn btn-sm text-muted"
               data-bs-toggle="collapse"
               href="#searchSettings"
               role="button"
               aria-expanded="false"
               aria-controls="searchSettings"
               title="{__('Settings')}">
                <i data-feather="settings" stroke-width="1"></i>
            </a>
        </li>
    </ul>

    <div class="collapse mt-1" id="searchSettings">
        <div class="card card-body">
            <div class="mb-1">
                <div class="text-muted">{__('plu_other_date')}</div>
                <div class="row">
                    <div class="col">{PLUGIN_SEARCH_DATE_SELECT}</div>
                    <div class="col">
                        {PLUGIN_SEARCH_DATE_FROM}
                    </div>
                    <div class="col">{PLUGIN_SEARCH_DATE_TO}</div>
                </div>
            </div>
            <div class="mb-1">
                <div class="text-muted">{__('plu_other_userfilter')}</div>
                {PLUGIN_SEARCH_USER}
            </div>
            <!-- BEGIN: PAGES_OPTIONS -->
            <div class="mb-1">
                <div class="text-muted">{__('Pages')}</div>
                <table class="table small">
                    <tr>
                        <td class="width50">
                            <div class="strong">{PHP.L.plu_pag_set_sec}:</div>
                            <div>{PLUGIN_PAGE_SEC_LIST}</div>
                            <div class="mt-1">{PLUGIN_PAGE_SEARCH_SUBCAT}</div>
                            <div class="text-muted">{PHP.L.plu_ctrl_list}</div>
                        </td>
                        <td class="width50">
                            <div class="strong">{PHP.L.plu_other_opt}:</div>
                            <div><label>{PLUGIN_PAGE_SEARCH_NAMES} {PHP.L.plu_pag_search_names}</label></div>
                            <div>{PLUGIN_PAGE_SEARCH_DESC}</div>
                            <div>{PLUGIN_PAGE_SEARCH_TEXT}</div>
                            <div>{PLUGIN_PAGE_SEARCH_FILE}</div>
                            <div class="strong">{PHP.L.plu_res_sort}:</div>
                            <div>{PLUGIN_PAGE_RES_SORT}</div>
                            <div>{PLUGIN_PAGE_RES_SORT_WAY}</div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- END: PAGES_OPTIONS -->
            <!-- BEGIN: FORUMS_OPTIONS -->
            <div class="mb-1">
                <div class="text-muted">{__('Forums')}</div>
                <table class="table small">
                    <tr>
                        <td class="width50">
                            <div class="strong">{__('plu_frm_set_sec')}:</div>
                            <div>{PLUGIN_FORUM_SEC_LIST}</div>
                            <div class="mt-1">{PLUGIN_FORUM_SEARCH_SUBCAT}</div>
                            <div class="text-muted">{__('plu_ctrl_list')}</div>
                        </td>
                        <td class="width50">
                            <div class="strong">{__('plu_other_opt')}:</div>
                            <div>{PLUGIN_FORUM_SEARCH_NAMES}</div>
                            <div>{PLUGIN_FORUM_SEARCH_POST}</div>
                            <div>{PLUGIN_FORUM_SEARCH_ANSW}</div>
                            <div class="strong">{__('plu_res_sort')}:</div>
                            <div>{PLUGIN_FORUM_RES_SORT}</div>
                            <div>{PLUGIN_FORUM_RES_SORT_WAY}</div>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- END: FORUMS_OPTIONS -->
        </div>
    </div>

    <div class="mt-3">
        <!-- BEGIN: RESULTS -->
        <!-- BEGIN: PAGES -->
        <div class="mb-2">
            <div class="small">{PLUGIN_PR_CATEGORY}</div>
            <h4>{PLUGIN_PR_TITLE}</h4>
            <div class="text-muted">{PLUGIN_PR_TEXT}</div>
            <div class="small">{PHP.L.plu_last_date}: {PLUGIN_PR_TIME}</div>
        </div>
        <hr>
        <!-- END: PAGES -->

        <!-- BEGIN: FORUMS -->
        <div class="mb-2">
            <div class="small">{PLUGIN_FR_CATEGORY}</div>
            <h4>{PLUGIN_FR_TITLE}</h4>
            <div class="text-muted">{PLUGIN_FR_TEXT}</div>
            <div class="small">{PHP.L.plu_last_date}: {PLUGIN_FR_TIME}</div>
        </div>
        <hr>
        <!-- END: FORUMS -->
        <!-- END: RESULTS -->
        {PLUGIN_PAGEPREV}{PLUGIN_PAGENAV}{PLUGIN_PAGENEXT}
    </div>

</form>


<!-- END: MAIN -->

<!-- BEGIN: PAGES_OPTIONS -->
<h3>{PHP.L.Pages}</h3>
<table class="main">
    <tr>
        <td class="width50">
            <p class="strong">{PHP.L.plu_pag_set_sec}:</p>
            <p>{PLUGIN_PAGE_SEC_LIST}</p>
            <p>{PLUGIN_PAGE_SEARCH_SUBCAT}</p>
            <p class="small">{PHP.L.plu_ctrl_list}</p>
        </td>
        <td class="width50">
            <p class="strong">{PHP.L.plu_other_opt}:</p>
            <p><label>{PLUGIN_PAGE_SEARCH_NAMES} {PHP.L.plu_pag_search_names}</label></p>
            <p>{PLUGIN_PAGE_SEARCH_DESC}</p>
            <p>{PLUGIN_PAGE_SEARCH_TEXT}</p>
            <p>{PLUGIN_PAGE_SEARCH_FILE}</p>
            <p class="strong">{PHP.L.plu_res_sort}:</p>
            <p>{PLUGIN_PAGE_RES_SORT}</p>
            <p>{PLUGIN_PAGE_RES_SORT_WAY}</p>
        </td>
    </tr>
</table>
<!-- END: PAGES_OPTIONS -->
<!-- BEGIN: FORUMS_OPTIONS -->
<h3>{PHP.L.Forums}</h3>
<table class="main">
    <tr>
        <td class="width50">
            <p class="strong">{PHP.L.plu_frm_set_sec}:</p>
            <p>{PLUGIN_FORUM_SEC_LIST}</p>
            <p>{PLUGIN_FORUM_SEARCH_SUBCAT}</p>
            <div class="small">{PHP.L.plu_ctrl_list}</div>
        </td>
        <td class="width50">
            <p class="strong">{PHP.L.plu_other_opt}:</p>
            <p>{PLUGIN_FORUM_SEARCH_NAMES}</p>
            <p>{PLUGIN_FORUM_SEARCH_POST}</p>
            <p>{PLUGIN_FORUM_SEARCH_ANSW}</p>
            <p class="strong">{PHP.L.plu_res_sort}:</p>
            <p>{PLUGIN_FORUM_RES_SORT}</p>
            <p>{PLUGIN_FORUM_RES_SORT_WAY}</p>

        </td>
    </tr>
</table>
<!-- END: FORUMS_OPTIONS -->

<div class="block">
    <h2 class="stats">{PLUGIN_TITLE}</h2>
    <div>

    </div>

    {FILE "{PHP.cfg.themes_dir}/{PHP.usr.theme}/warnings.tpl"}

    <!-- BEGIN: RESULTS -->
    <!-- BEGIN: PAGES -->
    <h3>{PHP.L.Pages}</h3>
    <table class="cells">
        <tr>
            <td colspan="2" class="coltop">{PHP.L.plu_result}: {PHP.L.plu_tabs_pag}
            </td>
        </tr>
        <!-- BEGIN: ITEM -->
        <tr>
            <td colspan="2" class="{PLUGIN_PR_ODDEVEN}">{PLUGIN_PR_TITLE}</td>
        </tr>
        <tr>
            <td colspan="2" class="{PLUGIN_PR_ODDEVEN}">{PLUGIN_PR_TEXT}</td>
        </tr>
        <tr>
            <td class="{PLUGIN_PR_ODDEVEN} width50"><p class="small">{PHP.L.plu_last_date}: {PLUGIN_PR_TIME}</p></td>
            <td class="{PLUGIN_PR_ODDEVEN} textright width50"><p class="small">{PHP.L.plu_section}
                    : {PLUGIN_PR_CATEGORY}</p></td>
        </tr>
        <!-- END: ITEM -->
    </table>
    <!-- END: PAGES -->

    <!-- BEGIN: FORUMS -->
    <h3>{PHP.L.Forums}</h3>
    <table class="cells">
        <tr>
            <td colspan="2" class="coltop">{PHP.L.plu_result}: {PHP.L.plu_tabs_frm}
            </td>
        </tr>
        <!-- BEGIN: ITEM -->
        <tr>
            <td colspan="2" class="{PLUGIN_FR_ODDEVEN}">{PLUGIN_FR_TITLE}</td>
        </tr>
        <!-- IF {PLUGIN_FR_TEXT} -->
        <tr>
            <td colspan="2" class="{PLUGIN_FR_ODDEVEN}">{PLUGIN_FR_TEXT}</td>
        </tr><!-- ENDIF -->
        <tr>
            <td class="{PLUGIN_FR_ODDEVEN} width50"><p class="small">{PHP.L.plu_last_date}: {PLUGIN_FR_TIME}</p></td>
            <td class="{PLUGIN_FR_ODDEVEN} textright width50"><p class="small">{PHP.L.plu_section}
                    : {PLUGIN_FR_CATEGORY}</p></td>
        </tr>
        <!-- END: ITEM -->
    </table>

    <!-- END: FORUMS -->
    <!-- END: RESULTS -->
    <p class="paging">{PLUGIN_PAGEPREV}{PLUGIN_PAGENAV}{PLUGIN_PAGENEXT}</p>
</div>
