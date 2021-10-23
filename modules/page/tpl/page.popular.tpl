<!-- BEGIN: MAIN -->
    <ul class="uk-list uk-list-divider tm-popular-page">
        <!-- BEGIN: PAGE_ROW -->
        <li>
           <div class="uk-grid uk-grid-small uk-flex-middle" uk-grid>
               <div class="uk-width-auto">
                    <!-- IF {PAGE_ROW_ID|cot_attach_one("images", $this, 0, "page")} -->
                    <img src="{PAGE_ROW_ID|cot_attach_one("images", $this, 0, "page")|cot_attach_thumb($this, "80x50", "f")}" alt="{PAGE_ROW_TITLE}" class="uk-border-rounded">
                    <!-- ELSE -->
                    <div class="tm-nophoto uk-border-rounded" style="width: 80px; height: 50px;"></div>
                    <!-- ENDIF -->
               </div>
               <div class="uk-width-expand">
                   <a href="{PAGE_ROW_URL}">{PAGE_ROW_TITLE}</a>
                   <small class="uk-text-muted"><i class="fa fa-calendar-o"></i> {PAGE_ROW_DATE}</small>
               </div>
           </div>
        </li>
        <!-- END: PAGE_ROW -->
    </ul>
<!-- END: MAIN -->