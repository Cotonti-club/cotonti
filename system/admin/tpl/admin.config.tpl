<!-- BEGIN: MAIN -->
{FILE "{PHP.cfg.system_dir}/admin/tpl/warnings.tpl"}
<div class="card">
    <div class="card-body p-3">
        <!-- BEGIN: EDIT -->
        {ADMIN_CONFIG_EDIT_CUSTOM}
        <form name="saveconfig" id="saveconfig" action="{ADMIN_CONFIG_FORM_URL}" method="post" class="ajax">
            <table class="table align-middle">
                <tr>
                    <td>{PHP.L.Parameter}</td>
                    <td class="width60">{PHP.L.Value}</td>
                    <td class="text-end"></td>
                </tr>
                <!-- BEGIN: ADMIN_CONFIG_ROW -->
                <!-- BEGIN: ADMIN_CONFIG_FIELDSET_BEGIN -->
                <tr>
                    <td class="group_begin" colspan="3">
                        <h4>{ADMIN_CONFIG_FIELDSET_TITLE}</h4>
                    </td>
                </tr>
                <!-- END: ADMIN_CONFIG_FIELDSET_BEGIN -->
                <!-- BEGIN: ADMIN_CONFIG_ROW_OPTION -->
                <tr>
                    <td>{ADMIN_CONFIG_ROW_CONFIG_TITLE}:</td>
                    <td>
                        {ADMIN_CONFIG_ROW_CONFIG}
                        <div class="text-muted small">{ADMIN_CONFIG_ROW_CONFIG_MORE}</div>
                    </td>
                    <td class="text-end">
                        <a href="{ADMIN_CONFIG_ROW_CONFIG_MORE_URL}" class="btn btn-outline-secondary">{PHP.L.Reset}</a>
                    </td>
                </tr>
                <!-- END: ADMIN_CONFIG_ROW_OPTION -->
                <!-- END: ADMIN_CONFIG_ROW -->
            </table>
            <input type="submit" class="submit btn btn-primary" value="{PHP.L.Update}"/>
        </form>
        <!-- END: EDIT -->
        <!-- BEGIN: DEFAULT -->
            <!-- BEGIN: ADMIN_CONFIG_COL -->
            <h3 class="clear">{ADMIN_CONFIG_COL_CAPTION}:</h3>
            <div class="container">
                <!-- BEGIN: ADMIN_CONFIG_ROW -->
                <a href="{ADMIN_CONFIG_ROW_URL}" class="ajax thumbicons">
                    <!-- IF {ADMIN_CONFIG_ROW_ICO} -->
                    <img src="{ADMIN_CONFIG_ROW_ICO}"/>
                    <!-- ELSE -->
                    <img src="{PHP.cfg.system_dir}/admin/img/plugins32.png"/>
                    <!-- ENDIF -->
                    {ADMIN_CONFIG_ROW_NAME}
                </a>
                <!-- END: ADMIN_CONFIG_ROW -->
            </div>
            <!-- END: ADMIN_CONFIG_COL -->
            <div class="clear"></div>
        <!-- END: DEFAULT -->
    </div>
</div>
<!-- END: MAIN -->