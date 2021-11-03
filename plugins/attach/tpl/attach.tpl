<!-- BEGIN:MAIN -->
<div class="uk-grid uk-child-width-1-4">
    <!-- BEGIN:ROWS -->
    <!-- IF {ATTACH_ROW_TYPE} == "image" -->
    <div data-uk-lightbox>
        <a href="{ATTACH_ROW_FULLPATH}" type="image" title="base64 300x150">
            <img src="{ATTACH_ROW_FULLPATH|cot_attach_thumb($this, "300x150", "b")}" title="base64" alt="base64">
        </a>
    </div>
    <!-- ELSE -->
    <div>
        <a href="{ATTACH_ROW_FULLPATH}">
            <img src="plugins/attach/assets/images/{ATTACH_ROW_TYPE}.png" title="{ATTACH_ROW_TYPE}" alt="{ATTACH_ROW_TYPE}">
        </a>
    </div>
    <!-- ENDIF -->
    <!-- END:ROWS -->
</div>
<!-- END:MAIN -->