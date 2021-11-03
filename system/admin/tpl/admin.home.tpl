<!-- BEGIN: MAIN -->
    <!-- BEGIN: UPDATE -->
    <div class="alert alert-warning bg-warning border-0 alert-dismissible fade show">
        <h3>{PHP.L.adminqv_update_notice}:</h3>
        <p>{ADMIN_HOME_UPDATE_REVISION} {ADMIN_HOME_UPDATE_MESSAGE}</p>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <!-- END: UPDATE -->
    {FILE "{PHP.cfg.system_dir}/admin/tpl/warnings.tpl"}

    <section class="section dashboard">
        <div class="row">
            <!-- BEGIN: TOPPANEL -->
            {ADMIN_HOME_TOPPANEL}
            <!-- END: TOPPANEL -->
        </div>
        <div class="row">
            <div class="col-lg-8">
                <!-- BEGIN: MAINPANEL -->
                {ADMIN_HOME_MAINPANEL}
                <!-- END: MAINPANEL -->
                <div class="card">
                    <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li><a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=main')}" class="dropdown-item">{PHP.L.home_ql_b1_1}</a></li>
                            <li><a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=title')}" class="dropdown-item">{PHP.L.home_ql_b1_2}</a></li>
                            <li><a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=theme')}" class="dropdown-item">{PHP.L.home_ql_b1_3}</a></li>
                            <li><a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=menus')}" class="dropdown-item">{PHP.L.home_ql_b1_4}</a></li>
                            <li><a href="{PHP|cot_url('admin','m=config&n=edit&o=core&p=locale')}" class="dropdown-item">{PHP.L.Locale}</a></li>
                            <li><a href="{PHP|cot_url('admin','m=extrafields')}" class="dropdown-item">{PHP.L.adm_extrafields}</a></li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Cotonti</h5>
                        <table class="table">
                            <tr>
                                <td class="width80">{PHP.L.Version}</td>
                                <td class="text-end">{ADMIN_HOME_VERSION}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.Database}</td>
                                <td class="text-end">{ADMIN_HOME_DB_VERSION}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.home_db_rows}</td>
                                <td class="text-end">{ADMIN_HOME_DB_TOTAL_ROWS}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.home_db_indexsize}</td>
                                <td class="text-end">{ADMIN_HOME_DB_INDEXSIZE}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.home_db_datassize}</td>
                                <td class="text-end">{ADMIN_HOME_DB_DATASSIZE}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.home_db_totalsize}</td>
                                <td class="text-end">{ADMIN_HOME_DB_TOTALSIZE}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.Plugins}</td>
                                <td class="text-end">{ADMIN_HOME_TOTALPLUGINS}</td>
                            </tr>
                            <tr>
                                <td>{PHP.L.Hooks}</td>
                                <td class="text-end">{ADMIN_HOME_TOTALHOOKS}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <!-- BEGIN: SIDEPANEL -->
                <div class="card">
                    <div class="card-body">
                        {ADMIN_HOME_SIDEPANEL}
                    </div>
                </div>
                <!-- END: SIDEPANEL -->
            </div>
        </div>
    </section>

<!-- END: MAIN -->

