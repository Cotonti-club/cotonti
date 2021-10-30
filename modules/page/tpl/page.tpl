<!-- BEGIN: MAIN -->
<div class="container">
    {PAGE_BREADCRUMBS}
    <div class="row">
        <div class="col-lg-8">
            <div>
                <div class="blog-item-content mt-5">
                    <div class="blog-item-meta mb-3">
                        <span class="text-color-2 text-capitalize mr-3"><i data-feather="bookmark"
                                                                           class="mr-2"></i> {PAGE_CATTITLE}</span>
                        <span class="text-muted text-capitalize mr-3"><i data-feather="message-square" class="mr-2"></i>5 Comments</span>
                        <span class="text-black text-capitalize mr-3"><i data-feather="calendar" class="mr-2"></i> 28th January 2019</span>
                    </div>

                    <h2 class="mb-4 text-md">{PAGE_TITLE}</h2>

                    {PAGE_TEXT}

                    <div class="mt-5 clearfix">
                        <ul class="float-left list-inline tag-option">
                            <!-- BEGIN: PAGE_TAGS_ROW -->
                            <li class="list-inline-item">
                                <a href="{PAGE_TAGS_ROW_URL}" title="{PAGE_TAGS_ROW_TAG}"
                                   el="nofollow">{PAGE_TAGS_ROW_TAG}</a>
                            </li>
                            <!-- END: PAGE_TAGS_ROW -->
                        </ul>
                    </div>

                    {PAGE_COMMENTS_DISPLAY}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="position-sticky">
                <div class="row row-cols-sm-2 row-cols-lg-1">
                    <!-- BEGIN: PAGE_ADMIN -->
                    <div class="mb-3">
                        <div class="p-3">
                            <h5 class="card-title">{__('Admin')}</h5>
                            <ul class="list-unstyled">
                                <!-- IF {PHP.usr.isadmin} -->
                                <li><a href="{PHP|cot_url('admin')}">{__('Adminpanel')}</a></li>
                                <!-- ENDIF -->
                                <li><a href="{PAGE_CAT|cot_url('page','m=add&c=$this')}">{__('page_addtitle')}</a></li>
                                <li>{PAGE_ADMIN_UNVALIDATE}</li>
                                <li>{PAGE_ADMIN_EDIT}</li>
                                <li>{PAGE_ADMIN_CLONE}</li>
                                <li>{PAGE_ADMIN_DELETE}</li>
                            </ul>
                        </div>
                    </div>
                    <!-- END: PAGE_ADMIN -->
                    <div class="mb-3">
                        <div class="p-3">
                            {PHP.c|cot_page_enum($this, 3, 'modules/page/tpl/page.popular.tpl')}
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="p-3">
                            <h5 class="card-title">{__('Categories')}</h5>
                            {CATALOG}
                        </div>
                    </div>
                    <!-- IF {PHP.cot_plugins_active.tags} -->
                    <div class="d-none d-md-block">
                        <div class="p-3">
                            <h5 class="uk-card-title mb-0">{PHP.L.Tags}</h5>
                            {LIST_TAG_CLOUD}
                        </div>
                    </div>
                    <!-- ENDIF -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END: MAIN -->


<div class="uk-card uk-card-small uk-card-default uk-margin-medium-top uk-margin-medium-bottom">
    <div class="uk-card-body">
        <!-- IF {PAGE_ID|cot_attach_one("images", $this, 0, "page")} -->
        <div class="uk-position-relative uk-visible-toggle" tabindex="-1" uk-slideshow="animation: pull">
            <ul class="uk-slideshow-items">
                <!-- FOR {KEY}, {VALUE} IN {PAGE_ID|cot_attach("images", $this, 0)} -->
                <li>
                    <img src="{VALUE.ATTACH_ROW_FULLPATH}" alt='' uk-cover>
                </li>
                <!-- ENDFOR -->
            </ul>
            <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-background-default uk-padding-small uk-border-rounded"
               href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-background-default uk-padding-small uk-border-rounded"
               href="#" uk-slidenav-next uk-slideshow-item="next"></a>
        </div>
        <!-- ENDIF -->
        <div class="uk-margin-small-top">
            <div class="uk-grid">
                <div class="uk-width-expand@s">
                    <!-- BEGIN: PAGE_ADMIN -->
                    <div>
                        <a href="javascript:void(0)" class="uk-button-text" uk-tooltip="{PHP.L.Adminpanel}"><span
                                    uk-icon="more"></span></a>
                        <div uk-dropdown="mode: click;">
                            <ul class="uk-nav uk-dropdown-nav">
                                <!-- IF {PHP.usr.isadmin} -->
                                <li><a href="{PHP|cot_url('admin')}">{PHP.L.Adminpanel}</a></li>
                                <!-- ENDIF -->
                                <li><a href="{PAGE_CAT|cot_url('page','m=add&c=$this')}">{PHP.L.page_addtitle}</a></li>
                                <li>{PAGE_ADMIN_UNVALIDATE}</li>
                                <li>{PAGE_ADMIN_EDIT}</li>
                                <li>{PAGE_ADMIN_CLONE}</li>
                                <li>{PAGE_ADMIN_DELETE}</li>
                            </ul>
                        </div>
                    </div>
                    <!-- END: PAGE_ADMIN -->
                </div>
                <div class="uk-width-1-2@s uk-width-1-3@m uk-width-1-4@l">
                    {PAGE_ID|cot_likes("page", $this)}
                </div>
            </div>
        </div>
        <h1 class="uk-h3 uk-margin-small-top">{PAGE_TITLE}</h1>
        {PAGE_TEXT}
        <div>
            <strong>{PHP.L.Tags}:</strong>
            <!-- BEGIN: PAGE_TAGS_ROW -->
            <!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF -->
            <a href="{PAGE_TAGS_ROW_URL}" title="{PAGE_TAGS_ROW_TAG}" el="nofollow">{PAGE_TAGS_ROW_TAG}</a>
            <!-- END: PAGE_TAGS_ROW -->
            <!-- BEGIN: PAGE_NO_TAGS -->
            {PAGE_NO_TAGS}
            <!-- END: PAGE_NO_TAGS -->
            </p>
        </div>
    </div>
</div>
<!-- BEGIN: PAGE_MULTI -->
<div class="block">
    <h2 class="info">{PHP.L.Summary}:</h2>
    {PAGE_MULTI_TABTITLES}
    <p class="paging">{PAGE_MULTI_TABNAV}</p>
</div>
<!-- END: PAGE_MULTI -->
{PAGE_COMMENTS_DISPLAY}