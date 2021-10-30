<!-- BEGIN: MAIN -->
<div class="container">
    {BREADCRUMBS}
    <div class="row justify-content-center mb-2 mt-2">
        <div class="col">
            <!-- IF {PHP.c} -->
            <h1>{LIST_CATTITLE}</h1>
            <!-- ELSE -->
            <h1>{PHP.L.page}</h1>
            <!-- ENDIF -->
        </div>
        <!-- IF {PHP.usr.auth_write} -->
        <div class="col-auto">
            <a class="btn btn-sm btn-primary" href="{PHP|cot_url('page', 'm=add')}">{PHP.L.Add}</a>
        </div>
        <!-- ENDIF -->
    </div>
    <!-- IF {LIST_CATDESC} -->
    <div class="card card-body mb-2">{LIST_CATDESC}</div>
    <!-- ENDIF -->
    <div class="row">
        <div class="col-lg-8">
            <!-- BEGIN: LIST_ROW -->
            <article class="row align-items-md-center post">
                <div class="col-3 col-sm-4 col-md-4 col-lg-3 post-media">
                    <div class="figure fade-in text-center figcaption-middle">
                        <a class="figure-image" href="{LIST_ROW_URL}">
                            <img alt="{LIST_ROW_TITLE}"
                                 src="https://picsum.photos/id/237/200/200"
                                 class="w-100"
                            >
                        </a>
                    </div>
                </div>
                <div class="col-9 col-sm-8 col-md-8 col-lg-9">
                    <header class="post-head small-screen-center">
                        <h2 class="post-title">
                            <a href="{LIST_ROW_URL}" rel="bookmark">
                                {LIST_ROW_SHORTTITLE}
                            </a>
                        </h2>
                        <div class="post-details">
                        <span class="post-date">
                            <i data-feather="clock"></i> {LIST_ROW_DATE}
                        </span>
                            <span class="post-author">
                            <i data-feather="user"></i>
                            {LIST_ROW_OWNER_NAME}
                        </span>
                            <span class="post-category">
                            <i data-feather="folder"></i>
                            <a href="{LIST_ROW_CATURL}">{LIST_ROW_CATTITLE}</a>
                        </span>
                        </div>
                    </header>
                    <div class="post-body">
                        {LIST_ROW_TEXT_CUT}
                    </div>
                    <div class="text-end post-more">
                        <a class="btn btn-sm btn-outline-secondary post-more-link" href="{LIST_ROW_URL}">
                            {__('ReadMore')}
                        </a>
                    </div>
                </div>
            </article>
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
        <div class="col-lg-4">
            <div class="position-sticky">
                <div class="row row-cols-sm-2 row-cols-lg-1">
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
