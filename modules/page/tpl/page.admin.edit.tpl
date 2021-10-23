<!-- BEGIN: MAIN -->
{FILE "system/admin/tpl/warnings.tpl"}

<form action="{PAGEEDIT_FORM_SEND}" method="post" name="edit" enctype="multipart/form-data">
    <div class="uk-grid" uk-grid>
        <div class="uk-width-expand@m">
            <div class="uk-card uk-card-small uk-card-default">
                <div class="uk-card-body">
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Title}</div>
                        <div>{PAGEEDIT_FORM_TITLE}</div>
                    </div>
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Description}</div>
                        <div>{PAGEEDIT_FORM_DESC}</div>
                    </div>
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Text}</div>
                        <div>{PAGEEDIT_FORM_TEXT}</div>
                    </div>
                    <!-- BEGIN: TAGS -->
                    <div class="uk-margin-bottom">
                        <div>{PAGEEDIT_TOP_TAGS} <small>({PAGEEDIT_TOP_TAGS_HINT})</small>:</div>
                        <div>{PAGEEDIT_FORM_TAGS} </div>
                    </div>
                    <!-- END: TAGS -->
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Pictures}</div>
                        <div>
                            {PAGEEDIT_FORM_ID|cot_attach_form_admin('page', "images", $this)}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="uk-width-1-4@m">
            <div class="uk-card uk-card-small uk-card-default">
                <div class="uk-card-body">
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Category}</div>
                        <div>{PAGEEDIT_FORM_CAT}</div>
                    </div>
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Alias}</div>
                        <div>{PAGEEDIT_FORM_ALIAS}</div>
                    </div>
                </div>
            </div>
            <div class="uk-card uk-card-small uk-card-default uk-margin-top">
                <div class="uk-card-body">
                    <div class="uk-margin-bottom">
                        <div>Meta title</div>
                        <div>{PAGEEDIT_FORM_METATITLE}</div>
                    </div>
                    <div class="uk-margin-bottom">
                        <div>Meta keywords</div>
                        <div>{PAGEEDIT_FORM_KEYWORDS}</div>
                    </div>
                    <div class="uk-margin-bottom">
                        <div>Meta descriptions</div>
                        <div>{PAGEEDIT_FORM_METADESC}</div>
                    </div>
                </div>
            </div>
            <div class="uk-card uk-card-small uk-card-default uk-margin-top">
                <div class="uk-card-body">
                    <!-- IF {PAGEEDIT_FORM_DELETE} -->
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Delete}</div>
                        <div>{PAGEEDIT_FORM_DELETE}</div>
                    </div>
                    <!-- ENDIF -->
                    <div class="uk-margin-bottom">
                        <div>{PHP.L.Action}</div>
                        <div>{PAGEEDIT_FORM_STATE_SELECT}</div>
                    </div>
                    <div class="uk-margin-bottom uk-text-center">
                        <button type="submit"  class="uk-button uk-button-small uk-button-primary">{PHP.L.Submit}</button>
                        <!-- IF {PAGEEDIT_FORM_ID} -->
                        <a href="{CALL|cot_url('page','c=$0%&id=$1%&alias=$2%')|PHP.pag.page_cat,PHP.pag.page_id,PHP.pag.page_alias|htmlspecialchars}" target="_blank" class="uk-button uk-button-small uk-button-default">{PHP.L.View}</a>
                        <!-- ENDIF -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- END: MAIN -->