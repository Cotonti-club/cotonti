<!-- BEGIN: MAIN -->
<div class="uk-margin-bottom">
    <a href="{PHP|cot_url('admin', "m=page&p=add")}" class="uk-button uk-button-small uk-button-primary">{PHP.L.Add}</a>
</div>
{FILE "system/admin/tpl/warnings.tpl"}
<div class="uk-card uk-card-small uk-card-default">
    <div class="uk-card-header uk-background-default" uk-sticky="bottom: true; media: m">
        <form action="{ADMIN_PAGE_FORM_URL}" method="get" class="uk-grid-small uk-form-stacked" uk-grid="">
            <div class="uk-width-expand@s">
                <label class="uk-form-label">{PHP.L.Search}</label>
                <div class="uk-form-controls">
                    {SEARCH_SQ}
                </div>
            </div>
            <div class="uk-width-expand@s">
                <label class="uk-form-label">{PHP.L.Category}</label>
                <div class="uk-form-controls">
                    {SEARCH_CAT}
                </div>
            </div>
            <div class="uk-width-expand@s">
                <label class="uk-form-label">{PHP.L.Show}</label>
                <div class="uk-form-controls">
                    {SEARCH_FILTER}
                </div>
            </div>
            <div class="uk-width-expand@s">
                <label class="uk-form-label">{PHP.L.Order}</label>
                <div class="uk-form-controls">
                    {SEARCH_ORDER}
                </div>
            </div>
            <div class="uk-width-expand@s">
                <label class="uk-form-label">&nbsp;</label>
                <div class="uk-form-controls">
                    {SEARCH_WAY}
                </div>
            </div>
            <div class="uk-width-auto@s">
                <label class="uk-form-label">&nbsp;</label>
                <button type="submit" name="search"
                        class="uk-button uk-button-small uk-button-primary">{PHP.L.Search}</button>
            </div>
        </form>
    </div>
    <form action="{PHP|cot_url('admin','m=page'),'',true}" id="page_form" method="POST">
        <div class="uk-card-body">
            <div id="listprojects" class="uk-overflow-auto">
                <table class="uk-table uk-table-small uk-table-divider uk-text-small">
                    <thead>
                    <tr class="pageitem">
                        <th width="8">
                            <input type="checkbox" class="uk-checkbox" data-id="post_arr"
                                   onchange="tableCheck('post_arr')">
                        </th>
                        <th width="10" class=" uk-visible@m">ID</th>
                        <th>{PHP.L.Title}</th>
                        <th width="100">{PHP.L.Author}</th>
                        <th width="100">{PHP.L.Category}</th>
                        <th width="150"  class="uk-visible@m">{PHP.L.Public_date}</th>
                        <th width="1%" class="uk-text-right">{PHP.L.Actions}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- BEGIN: PAGE_ROW -->
                    <tr class="pageitem">
                        <td><input type="checkbox" name="post_arr[]" class="uk-checkbox" value="{ADMIN_PAGE_ID}"></td>
                        <td class=" uk-visible@m">{ADMIN_PAGE_ID}</td>
                        <td class="uk-text-truncate">
                            <a href="{ADMIN_PAGE_URL}" target="_blank"
                               class="uk-text-muted uk-visible@m uk-margin-small-right"
                               uk-tooltip="{PHP.L.Preview}"><i class="mdi mdi-reply-all"></i></a>
                            <a href="{ADMIN_PAGE_ID|cot_url("admin", "m=page&p=edit&id=$this")}"
                               class="uk-button-text">{ADMIN_PAGE_TITLE}</a>
                        </td>
                        <td class=" uk-visible@m">{ADMIN_PAGE_OWNER_NAME|cot_rc_modify($this, 'target="_blank"')}</td>
                        <td class=" uk-visible@m">
                            <a href="{ADMIN_PAGE_CAT|cot_url("admin", "m=page&c=$this")}">{ADMIN_PAGE_CATTITLE}</a>
                        </td>
                        <td class="uk-text-muted uk-text-small uk-visible@m">{ADMIN_PAGE_DATE}</td>
                        <td class="uk-text-right">
                            <div class="uk-button-group">
                                <a href="{ADMIN_PAGE_ID|cot_url("admin", "m=page&p=edit&id=$this")}" uk-tooltip="{PHP.L.Edit}"
                                   class="uk-button uk-button-mini uk-button-primary">
                                    <i class="mdi mdi-table-edit"></i>
                                </a>
                                <!-- IF {ADMIN_PAGE_STATE} == 0 -->
                                <a href="{ADMIN_PAGE_URL_FOR_UNVALIDATE}" uk-tooltip="{PHP.L.adm_valqueue}"
                                   class="uk-button uk-button-mini uk-button-default confirm">
                                    <i class="mdi mdi-close"></i>
                                </a>
                                <!-- ENDIF -->
                                <!-- IF {ADMIN_PAGE_STATE} OR {ADMIN_PAGE_STATE} == 1 -->
                                <a href="{ADMIN_PAGE_URL_FOR_VALIDATED}" uk-tooltip="{PHP.L.Validate}"
                                   class="uk-button uk-button-mini uk-button-warning confirm">
                                    <i class="mdi mdi-check-bold"></i>
                                </a>
                                <!-- ENDIF -->
                                <a href="{ADMIN_PAGE_URL_FOR_DELETED}" uk-tooltip="{PHP.L.Delete}"
                                   class="uk-button uk-button-mini uk-button-danger confirm">
                                    <i class="mdi mdi-trash-can-outline"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <!-- END: PAGE_ROW -->
                    </tbody>
                    <tfooter>
                        <tr class="pageitem">
                            <th>
                                <input type="checkbox" class="uk-checkbox" data-id="post_arr" data-part="2"
                                       onchange="tableCheck('post_arr', 2)">
                            </th>
                            <th class=" uk-visible@m">ID</th>
                            <th>{PHP.L.Order_title}</th>
                            <th>{PHP.L.Author}</th>
                            <th>{PHP.L.Category}</th>
                            <th class=" uk-visible@m">{PHP.L.Public_date}</th>
                            <th class="uk-text-right">{PHP.L.Actions}</th>
                        </tr>
                    </tfooter>
                </table>
            </div>
        </div>
        <div class="uk-card-footer">
            <div class="uk-grid" uk-grid>
                <div class="uk-width-auto@s">
                    <select name="post_action" id="post_action" class="uk-select uk-form-small uk-width-small">
                        <option value="0">---</option>
                        <option value="delete">{PHP.L.Delete}</option>
                        <option value="validate">{PHP.L.Validate}</option>
                    </select>
                    <button type="submit" class="uk-button uk-button-small uk-button-default">{PHP.L.Confirm}</button>
                </div>
                <div class="uk-width-expand@s">
                    <ul class="uk-pagination">{ADMIN_PAGE_PAGINATION_PREV}{ADMIN_PAGE_PAGNAV}{ADMIN_PAGE_PAGINATION_NEXT}</ul>
                </div>
                <div class="uk-width-auto@s">
                   {PHP.L.Total}: {ADMIN_PAGE_TOTALITEMS}, {PHP.L.Onpage}: {ADMIN_PAGE_ON_PAGE}
                </div>
            </div>
        </div>
    </form>
</div>
<!-- END: MAIN -->