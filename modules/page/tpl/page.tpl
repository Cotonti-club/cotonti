<!-- BEGIN: MAIN -->
<div class="uk-container uk-margin-top uk-margin-bottom ">
    {PAGE_BREADCRUMBS}
    <div class="uk-card uk-card-small uk-card-default uk-margin-medium-top uk-margin-medium-bottom">
        <div class="uk-card-body">
            <!-- IF {PAGE_ID|cot_attach_one("images", $this, 0, "page")} -->
            <div class="uk-position-relative uk-visible-toggle" tabindex="-1" uk-slideshow="animation: pull">
                <ul class="uk-slideshow-items">
                    <!-- FOR {KEY}, {VALUE} IN {PAGE_ID|cot_attach("images", $this, 0)} -->
                    <li>
                        <img src="{VALUE.ATTACH_ROW_FULLPATH}" alt=''  uk-cover>
                    </li>
                    <!-- ENDFOR -->
                </ul>
                <a class="uk-position-center-left uk-position-small uk-hidden-hover uk-background-default uk-padding-small uk-border-rounded" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                <a class="uk-position-center-right uk-position-small uk-hidden-hover uk-background-default uk-padding-small uk-border-rounded" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
            </div>
            <!-- ENDIF -->
            <div class="uk-margin-small-top">
               <div class="uk-grid">
                   <div class="uk-width-expand@s">
                       <!-- BEGIN: PAGE_ADMIN -->
                       <div>
                           <a href="javascript:void(0)" class="uk-button-text" uk-tooltip="{PHP.L.Adminpanel}"><span uk-icon="more"></span></a>
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
</div>
<!-- END: MAIN -->
