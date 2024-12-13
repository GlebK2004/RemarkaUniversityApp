<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
<div class="app-main__outer">
    <div class="app-main__inner">
        <h1 style="text-align: center">Обзор данных для руководящих должностей</h1><hr>

         <#if user.isAdmin()>

        <hr><h2 style="text-align: center">Где мы есть:</h2><hr>

        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-danger mb-3 widget-chart widget-chart2 text-left card bg-dark">
                    <div class="widget-content">
                        <div class="widget-content-outer">
                            <div class="widget-content-wrapper">
                                <div class="widget-content-left pr-2 fsize-1">
                                    <div class="widget-numbers mt-0 fsize-3"> <a style="color: aliceblue">${percentMinsk}%</a> </div>
                                </div>
                                <div class="widget-content-right w-100">
                                    <div class="progress-bar-xs progress">
                                        <div class="progress-bar textureY" role="progressbar" aria-valuenow="${percentMinsk}" aria-valuemin="0" aria-valuemax="100" style="width: ${percentMinsk}%;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="widget-content-left fsize-1">
                                <div class="text-muted opacity-6"><a style="color: aliceblue">Минск</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-3">
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card  bg-dark">
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
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card bg-dark">
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
                <div class="card-shadow-success mb-3 widget-chart widget-chart2 text-left card  bg-dark">
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
        </div>

            <br><br><br>
            <br><br><br>
            <h3 style="text-align: center">Выявление лишних продаж</h3>
            <br>
            <h4> К «костылям» в системе сейчас можно отнести конвертации – сейчас при пересчёте занятий менеджеры в УЦ
                выбирают абонемент с ближайшим количеством занятий, скидку 1р. (есть в 1С для всех абонементов) и
                записывают заявку, внося оплату 1 рубль. За отчётный период самыми востребованными абонементами для
                конвертации занятий стали:
            </h4>
            <div style="text-align: center;">
                <img src="/static/images/sales_analysis/convert.png" alt="Описание изображения" style="width: 70%; max-width: 100%;">
            </div>
            <h4>Можно заметить, что большее число конвертаций осуществляется из групповых в индивидуальные (а не наоборот),
                offline-формат преобладает над online-ом.<br>
                Т. к. система мотивации менеджеров будет встроена в 1С, все по покупкам абонементам
                должны быть внесены корректно. Решение: создать фиктивные абонементы «Конвертация» для групповых и
                индивидуальных занятий. Количество занятий в абонементе – 1, стоимость – 1 рубль. Реально количество занятий,
                которое студент будет заниматься по конвертации менеджеры будут начислять бонусами через УЦ. После обновления
                функционала 1С они автоматически будут добавляться в конец индивидуально курса. Эта схема будет введена
                после того, как Анатолий подтвердит технический вопрос по корректности добавления бонусных занятий.
            </h4>
            <br>
            <h3 style="text-align: center">Анализ распределения дохода</h3>
            <br>
            <h4>По итогам анализа массива оплат также было выявлено несколько тенденций.
                Распределение дохода по типам абонементов и занятий выглядит так:</h4>
            <div style="text-align: center;">
                <img src="/static/images/sales_analysis/pies.png" alt="Описание изображения" style="width: 70%; max-width: 100%;">
            </div>
            <h4>Можно заметить, что доля оффлайн-занятий значительно превышает онлайн. Индивидуальные и
                групповые абонементы «продаются» примерно поровну.</h4>
            <br>
            <h4>Сравнение количества проданных месяцев обучения (только по четырём продуктам) за последние полгода:</h4>
            <div style="text-align: center;">
                <img src="/static/images/sales_analysis/pie_months.png" alt="Описание изображения" style="width: 70%; max-width: 100%;">
            </div>





            <br><br><br> <br><br><br><br><br><br><br><br><br>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-12 col-lg-6">
                        <div class="mb-3 card">
                            <div class="card-header-tab card-header-tab-animation card-header texture">
                                <div class="card-header-title">
                                    <i class="header-icon lnr-apartment icon-gradient bg-love-kiss" style="color: aliceblue"></i>
                                    <a style="color: aliceblue">Нагрузка университетов</a>
                                </div>
                            </div>
                            <div class="card-body textureY">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="tabs-eg-77">
                                        <div class="widget-chart widget-chart2 text-left w-100">
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
                                    <i class="header-icon lnr-rocket icon-gradient bg-tempting-azure"></i>
                                    <a style="color: aliceblue">Динамика загруженности</a>
                                </div>
                            </div>
                            <div class="card-body">
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
                </div>
            </div>


    <#else>
        <br>

        <br><br>
        <h1 style="text-align: center">Упс, кажется у вас нет доступа:(</h1>

    </#if>
    </div>
    </div>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>




<script type="text/javascript" src="https://demo.dashboardpack.com/architectui-html-free/assets/scripts/main.js"></script>


</@t.template>


<@f.template f>
</@f.template>