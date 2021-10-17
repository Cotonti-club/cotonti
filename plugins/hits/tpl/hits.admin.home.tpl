<!-- BEGIN: MAIN -->
<div class="card">
    <div class="card-body">
        <h5 class="card-title">{HITS_STAT_HEADER}</h5>
        <!-- BEGIN: STAT -->
        <div id="hitsChart"></div>

        <script>
          document.addEventListener("DOMContentLoaded", () => {
            new ApexCharts(document.querySelector("#hitsChart"), {
              series: [{
                name: "{PHP.L.hits}",
                data: {PHP.hits_d|array_reverse|array_values|json_encode($this, 32)}
              }],
              chart: {
                height: 300,
                type: 'line',
                zoom: {
                  enabled: false
                }
              },
              dataLabels: {
                enabled: false
              },
              stroke: {
                curve: 'straight'
              },
              grid: {
                row: {
                  colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                  opacity: 0.5
                },
              },
              xaxis: {
                categories: {PHP.hits_d|array_reverse|array_keys|json_encode($this)},
              }
            }).render();
          });
        </script>
        <!-- END: STAT -->
    </div>
</div>
<div class="card">
    <div class="card-body">
        <h5 class="card-title">{ACTIVITY_STAT_HEADER}</h5>
        <!-- BEGIN: ACTIVITY -->
        <table class="table">
            <tr>
                <td class="width80"><a href="{ADMIN_HOME_NEWUSERS_URL}">{PHP.L.home_newusers}</a></td>
                <td class="textcenter width20">{ADMIN_HOME_NEWUSERS}</td>
            </tr>
            <tr>
                <td><a href="{ADMIN_HOME_NEWPAGES_URL}">{PHP.L.home_newpages}</a></td>
                <td class="textcenter">{ADMIN_HOME_NEWPAGES}</td>
            </tr>
            <!-- IF {PHP.cot_modules.forums} -->
            <tr>
                <td><a href="{ADMIN_HOME_NEWTOPICS_URL}">{PHP.L.home_newtopics}</a></td>
                <td class="textcenter">{ADMIN_HOME_NEWTOPICS}</td>
            </tr>
            <tr>
                <td><a href="{ADMIN_HOME_NEWPOSTS_URL}">{PHP.L.home_newposts}</a></td>
                <td class="textcenter">{ADMIN_HOME_NEWPOSTS}</td>
            </tr>
            <!-- ENDIF -->
            <!-- IF {PHP.cot_modules.pm} -->
            <tr>
                <td>{PHP.L.home_newpms}</td>
                <td class="textcenter">{ADMIN_HOME_NEWPMS}</td>
            </tr>
            <!-- ENDIF -->
        </table>
        <!-- END: ACTIVITY -->
    </div>
</div>
<!-- END: MAIN -->


<div class="card">
    <div class="card-body">
        <ul class="nav nav-tabs nav-tabs-bordered" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                        type="button" role="tab" aria-controls="pills-home" aria-selected="true">
                    {HITS_STAT_HEADER}
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                        type="button" role="tab" aria-controls="pills-profile" aria-selected="false">
                    {ACTIVITY_STAT_HEADER}
                </button>
            </li>
        </ul>
        <div class="tab-content pt-2" id="myTabContent">
            <!-- BEGIN: STAT -->
            <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="home-tab">
                <table class="table">
                    <!-- BEGIN: ADMIN_HOME_ROW -->
                    <tr>
                        <td class="w-25">{ADMIN_HOME_DAY}</td>
                        <td class="w-auto">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: {ADMIN_HOME_PERCENTBAR}%"
                                     aria-valuenow="{ADMIN_HOME_PERCENTBAR}" aria-valuemin="0"
                                     aria-valuemax="100">{ADMIN_HOME_PERCENTBAR}%
                                </div>
                            </div>
                        </td>
                        <td class="w-25">{PHP.L.Hits}: {ADMIN_HOME_HITS}</td>
                    </tr>
                    <!-- END: ADMIN_HOME_ROW -->
                </table>
                <a href="{ADMIN_HOME_MORE_HITS_URL}" class="btn btn-sm btn-primary">{PHP.L.ReadMore}</a>
            </div>
            <!-- END: STAT -->
        </div>
    </div>
</div>
