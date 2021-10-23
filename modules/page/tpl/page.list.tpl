<!-- BEGIN: MAIN -->
<div class="uk-container uk-margin-top uk-margin-bottom ">
    {BREADCRUMBS}
    <div class="uk-grid uk-flex-middle uk-margin-bottom" uk-grid>
        <div class="uk-width-expand@m">
            <!-- IF {PHP.c} -->
            <h1>{LIST_CATTITLE}</h1>
            <!-- ELSE -->
            <h1>{PHP.L.page}</h1>
            <!-- ENDIF -->
        </div>
        <!-- IF {PHP.usr.auth_write} -->
        <div class="uk-width-auto@m">
            <a class="uk-button uk-button-small uk-button-primary" href="{PHP|cot_url('page', 'm=add')}">{PHP.L.Add}</a>
        </div>
        <!-- ENDIF -->
    </div>
    <!-- IF {LIST_CATDESC} -->
    <div class="uk-card uk-card-small uk-card-secondary uk-card-body uk-margin-medium-bottom">{LIST_CATDESC}</div>
    <!-- ENDIF -->
    <div class="uk-grid" uk-grid>
        <div class="uk-width-1-4@m uk-width-1-4@m">
            <div uk-sticky="media: @m; bottom: true; offset: 100;"
                 class="uk-position-z-index">
                <div class="uk-grid uk-grid-small uk-child-width-1-2@s uk-child-width-1-1@m" uk-grid>
                    <div>
                        <div class="uk-card uk-card-small uk-card-default">
                            <div class="uk-card-header">
                                <h3 class="uk-card-title">{PHP.L.Categories}</h3>
                            </div>
                            <div class="uk-card-body">
                                {CATALOG}
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="uk-card uk-card-small uk-card-default">
                            <div class="uk-card-header">
                                <h3 class="uk-card-title">{PHP.L.Popular}</h3>
                            </div>
                            <div class="uk-margin-top uk-margin-bottom">
                                {PHP.c|cot_page_enum($this, 3, 'modules/page/tpl/page.popular.tpl')}
                            </div>
                        </div>
                    </div>
                    <!-- IF {PHP.cot_plugins_active.tags} -->
                    <div class="uk-visible@m">
                        <div class="uk-card uk-card-small uk-card-default">
                            <div class="uk-card-header">
                                <h3 class="uk-card-title">{PHP.L.Tags}</h3>
                            </div>
                            <div class=" uk-card-body">
                                {LIST_TAG_CLOUD}
                            </div>
                        </div>
                    </div>
                    <!-- ENDIF -->
                </div>
            </div>
        </div>
        <div class="uk-width-expand@m">
            <!-- BEGIN: LIST_ROW -->
            <div class="uk-card uk-card-small uk-card-default uk-margin-medium-bottom">
                <div>
                    <a href="{LIST_ROW_URL}">
                        <!-- IF {LIST_ROW_ID|cot_attach_one("images", $this, 0, "page")} -->
                        <img src="{LIST_ROW_ID|cot_attach_one("images", $this, 0, "page")|cot_attach_thumb($this, "730x240", "f")}"
                             alt="{LIST_ROW_TITLE}" class="uk-width-1-1">
                        <!-- ELSE -->
                        <div class="tm-nophoto" style="padding-top: 33%; width: 100%;"></div>
                        <!-- ENDIF -->
                    </a>
                </div>
                <div class="uk-card-body">
                    <div class="uk-grid uk-flex-middle" uk-grid>
                        <div class="uk-text-truncate">
                            <a href="{LIST_ROW_URL}" class="uk-button-text uk-card-title">{LIST_ROW_SHORTTITLE}</a>
                        </div>
                    </div>
                    <div class="uk-grid uk-flex-middle uk-margin-small-top" uk-grid>
                        <div class="uk-width-expand@m">
                            <div class="uk-grid uk-grid-small uk-grid-divider uk-flex-middle" uk-grid>
                                <div class="uk-width-auto uk-text-muted uk-text-small">
                                    <i class="fa fa-calendar-o"></i> {LIST_ROW_DATE}
                                </div>
                                <div class="uk-width-auto">
                                    <div class="uk-flex uk-flex-middle">
                                        <div class="uk-margin-small-right">
                                            {LIST_ROW_OWNER_AVATAR|cot_rc_modify($this, 'class="uk-border-circle" width="18"')}
                                        </div>
                                        <div class="tm-user-name">{LIST_ROW_OWNER_NAME}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="uk-width-auto@m">
                            <!-- IF {PHP.cot_plugins_active.tags} -->
                            {PHP.L.Tags}:
                            <!-- BEGIN: LIST_ROW_TAGS_ROW -->
                            <!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF -->
                            <a href="{LIST_ROW_TAGS_ROW_URL}" title="{LIST_ROW_TAGS_ROW_TAG}"
                               rel="nofollow">{LIST_ROW_TAGS_ROW_TAG}</a>
                            <!-- END: LIST_ROW_TAGS_ROW -->
                            <!-- BEGIN: PAGE_NO_TAGS -->{LIST_ROW_NO_TAGS}<!-- END: PAGE_NO_TAGS -->
                            <!-- ENDIF -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- END: LIST_ROW -->
            <!-- IF {LIST_TOP_PAGINATION} -->
            <div class="uk-text-center">
                <ul class="uk-pagination">{LIST_TOP_PAGEPREV}{LIST_TOP_PAGINATION}{LIST_TOP_PAGENEXT}</ul>
            </div>
            <p class="uk-text-muted">
                {PHP.L.Page} {LIST_TOP_CURRENTPAGE} {PHP.L.Of} {LIST_TOP_TOTALPAGES}
            </p>
            <!-- ENDIF -->
        </div>
    </div>
</div>

<!-- END: MAIN -->


<div class="col3-2 first">
    <div class="block">
        <h2 class="folder">{LIST_CATTITLE}</h2>
        <!-- BEGIN: LIST_ROWCAT -->
        <h3><a href="{LIST_ROWCAT_URL}" title="{LIST_ROWCAT_TITLE}">{LIST_ROWCAT_TITLE}</a> ({LIST_ROWCAT_COUNT})</h3>
        <!-- IF {LIST_ROWCAT_DESC} -->
        <p class="small">{LIST_ROWCAT_DESC}</p>
        <!-- ENDIF -->
        <!-- END: LIST_ROWCAT -->

        <!-- BEGIN: LIST_ROW -->
        <h3><a href="{LIST_ROW_URL}">{LIST_ROW_SHORTTITLE}</a></h3>
        <!-- IF {LIST_ROW_DESC} --><p class="small marginbottom10">{LIST_ROW_DESC}</p><!-- ENDIF -->
        <!-- IF {PHP.usr.isadmin} --><p class="small marginbottom10">{LIST_ROW_ADMIN} ({LIST_ROW_COUNT})</p>
        <!-- ENDIF -->
        <div>
            {LIST_ROW_TEXT_CUT}
            <!-- IF {LIST_ROW_TEXT_IS_CUT} -->{LIST_ROW_MORE}<!-- ENDIF -->
        </div>
        <!-- END: LIST_ROW -->
    </div>
    <!-- IF {LIST_TOP_PAGINATION} -->
    <p class="paging clear">
        <span>{PHP.L.Page} {LIST_TOP_CURRENTPAGE} {PHP.L.Of} {LIST_TOP_TOTALPAGES}</span>{LIST_TOP_PAGEPREV}{LIST_TOP_PAGINATION}{LIST_TOP_PAGENEXT}
    </p>
    <!-- ENDIF -->
</div>

<div class="col3-1">
    <!-- IF {PHP.usr.auth_write} -->
    <div class="block">
        <h2 class="admin">{PHP.L.Admin}</h2>
        <ul class="bullets">
            <!-- IF {PHP.usr.isadmin} -->
            <li><a href="{PHP|cot_url('admin')}">{PHP.L.Adminpanel}</a></li>
            <!-- ENDIF -->
            <li>{LIST_SUBMITNEWPAGE}</li>
        </ul>
    </div>
    <!-- ENDIF -->
    <div class="block">
        <h2 class="tags">{PHP.L.Tags}</h2>
        {LIST_TAG_CLOUD}
    </div>
    {FILE "{PHP.cfg.themes_dir}/{PHP.theme}/inc/contact.tpl"}
</div>

