<!-- BEGIN: MAIN -->
<script>
    var url = '{ATTACH_AJAXURL}';
</script>
<div id="{ATTACH_BLOCKID}" class="uk-grid uk-grid-small" uk-grid uk-sortable>
    <!-- BEGIN: FILES -->
    <div class="uk-text-center block-{ATTACH_BLOCKID}" data-id="{ATTACH_FILE_ID}">
        <div class="uk-text-center uk-position-relative uk-margin-small-bottom" style="width: 200px; height: 200px;">
            <!-- IF {ATTACH_FILE_TYPE} == "image" -->
            <img src="{ATTACH_FILE_THUMB}" class="uk-width-1-1" alt="{ATTACH_FILE_NANE}" title="{ATTACH_FILE_NANE}" data-uk-tooltip>
            <!-- ELSE -->
            <img src="{ATTACH_FILE_THUMB}" class="uk-width-1-1" alt="{ATTACH_FILE_NANE}" title="{ATTACH_FILE_NANE}" data-uk-tooltip>
            <!-- ENDIF -->
        </div>
        <a href="javascript:void(0)" data-target="{ATTACH_BLOCKID}" data-delete-id="{ATTACH_FILE_ID}" class="uk-text-small uk-button-link">
            {PHP.L.Delete}
        </a>
    </div>
    <!-- END: FILES -->
    <div class="block-{ATTACH_BLOCKID} uk-hidden" data-id="">
        <div class="uk-text-center">
            <div class="uk-text-center uk-position-relative uk-margin-small-bottom" style="width: 200px; height: 200px;">
                <img src="" class="uk-width-1-1" alt="" title="" data-uk-tooltip>
            </div>
            <a href="javascript:void(0)" data-target="{ATTACH_BLOCKID}" data-delete-id="" class="uk-text-small uk-button-link">{PHP.L.Delete}</a>
        </div>
    </div>
</div>
<div class="uk-text-center uk-display-inline-block uk-margin-small-top">
    <div class="uk-width-1-1" uk-form-custom>
        <div class="uk-placeholder uk-margin-small-bottom uk-position-relative" style="width: 200px; height: 200px; box-sizing: border-box;">
            {ATTACH_INPUT}
            <span uk-icon="icon: plus-circle; ratio: 2;" class="uk-position-center"></span>
        </div>
    </div>
</div>

<!-- END: MAIN -->
