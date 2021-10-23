<!-- BEGIN: MAIN -->
<!-- BEGIN: PAGE_ROW -->
<div class="uk-card uk-card-small uk-card-default uk-margin-medium-bottom">
    <div class="uk-card-header">
        <div class="uk-grid uk-flex-middle" uk-grid>
            <div class="uk-width-expand@m">
                <div class="uk-text-truncate">
                    <a href="{PAGE_ROW_URL}" class="uk-button-text uk-card-title">{PAGE_ROW_SHORTTITLE}</a>
                </div>
            </div>
            <div class="uk-width-auto@m">
                <a href="{PAGE_ROW_CATURL}">{PAGE_ROW_CATTITLE}</a>
                {PAGE_ROW_FAVORITE}
            </div>
        </div>
    </div>
    <div class="uk-card-body">
        <div class="uk-grid uk-flex-middle" uk-grid>
            <!-- IF {PAGE_ROW_MAVATAR.1} -->
            <div class="uk-width-auto">
                <a href="{PAGE_ROW_ROW_URL}"><img src="{PAGE_ROW_MAVATAR.1|cot_mav_thumb($this, 100, 100, crop)}"/></a>
            </div>
            <!-- ENDIF -->
            <div class="uk-width-expand">
                {PAGE_ROW_DESC}
            </div>
        </div>
    </div>
    <div class="uk-card-footer">
        <div class="uk-grid uk-flex-middle" uk-grid>
            <div class="uk-width-expand@m">
                <div class="uk-grid uk-grid-small uk-flex-middle" uk-grid>
                    <div class="uk-width-auto">
                        {PAGE_ROW_OWNER_AVATAR|cot_rc_modify($this, 'class="uk-border-circle" width="18"')}
                    </div>
                    <div class="uk-width-auto">
                        <div>{PAGE_ROW_OWNER_NAME}</div>
                    </div>
                    <div class="uk-width-auto uk-text-muted uk-text-small">
                        {PAGE_ROW_DATE}
                    </div>
                </div>
            </div>
            <div class="uk-width-auto@m">
                <!-- IF {PHP.cot_plugins_active.tags} -->
                {PHP.L.Tags}:
                <!-- BEGIN: PAGE_ROW_TAGS_ROW --><!-- IF {PHP.tag_i} > 0 -->, <!-- ENDIF --><a
                        href="{PAGE_ROW_TAGS_ROW_URL}" title="{PAGE_ROW_TAGS_ROW_TAG}"
                        rel="nofollow">{PAGE_ROW_TAGS_ROW_TAG}</a><!-- END: PAGE_ROW_TAGS_ROW -->
                <!-- BEGIN: PAGE_ROW_NO_TAGS -->{PAGE_ROW_NO_TAGS}<!-- END: PAGE_ROW_NO_TAGS -->
                <!-- ENDIF -->
            </div>
        </div>
    </div>
</div>
<!-- END: PAGE_ROW -->

<!-- IF {PAGE_PAGINATION} -->
<div class="uk-text-center"><ul class="uk-pagination">{PAGE_PAGEPREV}{PAGE_PAGINATION}{PAGE_PAGENEXT}</ul></div>
<p class="uk-text-muted">
    {PHP.L.Page} {PAGE_CURRENTPAGE} {PHP.L.Of} {PAGE_TOTALPAGES}
</p>
<!-- ENDIF -->

<!-- IF {PAGE_TOP_PAGINATION} -->
<div class="uk-text-center"><ul class="uk-pagination">{PAGE_TOP_PAGEPREV}{PAGE_TOP_PAGINATION}{PAGE_TOP_PAGENEXT}</ul></div>
<p class="uk-text-muted">
    {PHP.L.Page} {PAGE_TOP_CURRENTPAGE} {PHP.L.Of} {PAGE_TOP_TOTALPAGES}
</p>
<!-- ENDIF -->
<!-- END: MAIN -->
