<#import "blocks/template.ftlh" as t>
<@t.template user>
<div class="app-main__outer">
    <div class="app-main__inner">
        <h1 style="text-align: center">Обзор Ремарки</h1><hr>
        <div class="row">
            <div class="col-md-12 col-lg-6">
                <div class="mb-3 card">
                    <div class="card-header-tab card-header-tab-animation card-header texture">
                        <div class="card-header-title ">
                            <i class="header-icon lnr-apartment icon-gradient bg-love-kiss" style="color: aliceblue" > </i>
                            <a style="color: aliceblue">Нагрузка университетов</a>
                        </div>
                    </div>
                    <div class="card-body textureY">
                        <div class="tab-content ">
                            <div class="tab-pane fade show active " id="tabs-eg-77">
                                <div class="card mb-3 widget-chart widget-chart2 text-left w-100 ">
                                    <div class="widget-chat-wrapper-outer">
                                        <div class="widget-chart-wrapper widget-chart-wrapper-lg opacity-10 m-0">
                                            <canvas id="canvas"></canvas>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-6">
                <div class="mb-3 card">
                    <div class="card-header-tab card-header texture">
                        <div class="card-header-title">
                            <i class="header-icon lnr-rocket icon-gradient bg-tempting-azure"> </i>
                            <a style="color: aliceblue"> Динамика загруженности </a>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="tab-eg-55">
                            <div class="widget-chart p-3 textureY">
                                <div style="height: 350px">
                                    <canvas id="line-chart"></canvas>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <hr><h2 style="text-align: center">Где мы есть:</h2><hr>

        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card textureY">
                    <div class="widget-content">
                        <div class="widget-content-outer">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left pr-2 fsize-1">
                                    <div class="widget-numbers mt-0 fsize-3"> <a style="color: black">${percentMinsk}%</a> </div>
                                </div>
                                <div class="widget-content-right w-100">
                                    <div class="progress-bar-xs progress">
                                        <div class="progress-bar texture" role="progressbar" aria-valuenow="${percentMinsk}" aria-valuemin="0" aria-valuemax="100" style="width: ${percentMinsk}%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left fsize-1">
                                <div class="text-muted opacity-6"><a style="color: black">Минск</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card texture">
                    <div class="widget-content">
                        <div class="widget-content-outer">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left pr-2 fsize-1">
                                    <div class="widget-numbers mt-0 fsize-3 "><a style="color: aliceblue">${percentGomel}%</a> </div>
                                </div>
                                <div class="widget-content-right w-100">
                                    <div class="progress-bar-xs progress">
                                        <div class="progress-bar textureY" role="progressbar" aria-valuenow="${percentGomel}" aria-valuemin="0" aria-valuemax="100" style="width: ${percentGomel}%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left fsize-1">
                                <div class="text-muted opacity-6"><a style="color: aliceblue">Гомель</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card texture">
                    <div class="widget-content">
                        <div class="widget-content-outer">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left pr-2 fsize-1">
                                    <div class="widget-numbers mt-0 fsize-3 "><a style="color: aliceblue">${percentGrodno}%</a> </div>
                                </div>
                                <div class="widget-content-right w-100">
                                    <div class="progress-bar-xs progress">
                                        <div class="progress-bar textureY" role="progressbar" aria-valuenow="${percentGrodno}" aria-valuemin="0" aria-valuemax="100" style="width: ${percentGrodno}%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left fsize-1">
                                <div class="text-muted opacity-6"><a style="color: aliceblue">Гродно</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card texture">
                    <div class="widget-content">
                        <div class="widget-content-outer">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left pr-2 fsize-1">
                                    <div class="widget-numbers mt-0 fsize-3 "><a style="color: aliceblue">${percentVitebsk}%</a> </div>
                                </div>
                                <div class="widget-content-right w-100">
                                    <div class="progress-bar-xs progress">
                                        <div class="progress-bar textureY" role="progressbar" aria-valuenow="${percentVitebsk}" aria-valuemin="0" aria-valuemax="100" style="width: ${percentVitebsk}%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left fsize-1">
                                <div class="text-muted opacity-6"><a style="color: aliceblue">Витебск</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br>


        </div>
    </div>
      </div>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
</div>
</div>
<script type="text/javascript" src="https://demo.dashboardpack.com/architectui-html-free/assets/scripts/main.js"></script></body>

    </html>
</@t.template>