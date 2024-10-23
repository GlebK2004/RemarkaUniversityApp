<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 4 Dashboard</title>
    <base target="_self">
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button."
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google" value="notranslate">
    <link rel="shortcut icon" href="/images/cp_ico.png">


    <!--stylesheets / link tags loaded here-->


    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" />


    <style type="text/css">
        body,
        html {
            height: 100%;
        }
        /* workaround modal-open padding issue */

        body.modal-open {
            padding-right: 0 !important;
        }

        #sidebar {
            padding-left: 0;
        }
        /*
     * Off Canvas at medium breakpoint
     * --------------------------------------------------
     */

        @media screen and (max-width: 48em) {
            .row-offcanvas {
                position: relative;
                -webkit-transition: all 0.25s ease-out;
                -moz-transition: all 0.25s ease-out;
                transition: all 0.25s ease-out;
            }
            .row-offcanvas-left .sidebar-offcanvas {
                left: -33%;
            }
            .row-offcanvas-left.active {
                left: 33%;
                margin-left: -6px;
            }
            .sidebar-offcanvas {
                position: absolute;
                top: 0;
                width: 33%;
                height: 100%;
            }
        }
        /*
     * Off Canvas wider at sm breakpoint
     * --------------------------------------------------
     */

        @media screen and (max-width: 34em) {
            .row-offcanvas-left .sidebar-offcanvas {
                left: -45%;
            }
            .row-offcanvas-left.active {
                left: 45%;
                margin-left: -6px;
            }
            .sidebar-offcanvas {
                width: 45%;
            }
        }

        .card {
            overflow: hidden;
        }

        .card-block .rotate {
            z-index: 8;
            float: right;
            height: 100%;
        }

        .card-block .rotate i {
            color: rgba(20, 20, 20, 0.15);
            position: absolute;
            left: 0;
            left: auto;
            right: -10px;
            bottom: 0;
            display: block;
            -webkit-transform: rotate(-44deg);
            -moz-transform: rotate(-44deg);
            -o-transform: rotate(-44deg);
            -ms-transform: rotate(-44deg);
            transform: rotate(-44deg);
        }
    </style>

</head>

<body>


        <div class="col-md-9 col-lg-10 main">

            <!--toggle sidebar button
                <p class="hidden-md-up">
                    <button type="button" class="btn btn-primary-outline btn-sm" data-toggle="offcanvas"><i class="fa fa-chevron-left"></i> Menu</button>
                </p>-->

            <h1 class="display-2 hidden-xs-down">
                Аналитика
            </h1>
            <p class="lead hidden-xs-down">remarka.by</p>

            <div class="alert alert-warning fade collapse" role="alert" id="myAlert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>

            <div class="row mb-3">
                <div class="col-xl-3 col-lg-6">
                    <div class="card card-inverse card-success">
                        <div class="card-block bg-success textureY">
                            <div class="rotate">
                                <i class="fa fa-user fa-5x"></i>
                            </div>
                            <h6 class="text-uppercase" style="color: black">Преподаватели</h6>
                            <h1 class="display-1" style="color: black">${countUsers}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6">
                    <div class="card card-inverse card-danger textureY">
                        <div class="card-block bg-danger textureY">
                            <div class="rotate">
                                <i class="fa fa-list fa-4x"></i>
                            </div>
                            <h6 class="text-uppercase" style="color: black">Предметы</h6>
                            <h1 class="display-1" style="color: black">${countProducts}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6">
                    <div class="card card-inverse card-info">
                        <div class="card-block bg-info textureY">
                            <div class="rotate">
                                <i class="fa fa-twitter fa-5x"></i>
                            </div>
                            <h6 class="text-uppercase" style="color: black">Университеты</h6>
                            <h1 class="display-1" style="color: black">${countUniversities}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-6">
                    <div class="card card-inverse card-warning">
                        <div class="card-block bg-warning texture">
                            <div class="rotate">
                                <i class="fa fa-share fa-5x" style="color: gold;"></i>
                            </div>
                            <h6 class="text-uppercase" style="color: gold">Администраторы</h6>
                            <h1 class="display-1" style="color: gold">2</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->



            <a id="features"></a>
            <hr>
            <p class="lead">
                Ремарка - система автоматизации процессов формирования и распределения учебной нагрузки
                профессорско-преподавательского персонала учреждения высшего образования #1
            </p>

            <hr>
            <div class="row mb-3">
                <div class="col-lg-3 col-md-4">

                    <div class="card card-inverse bg-inverse mt-3">
                        <div class="card-block texture">
                            <h3 class="card-title">Предметы</h3>
                            <p class="card-text">Посмотреть подробную информацию о дисциплинах:</p>
                            <a href="/" class="btn btn-outline-secondary"> Далее </a>
                        </div>
                    </div>

                </div>
                <div class="col-lg-9 col-md-8">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="texture">
                            <tr>
                                <th style="color: aliceblue">#</th>
                                <th style="color: aliceblue">Название</th>
                                <th style="color: aliceblue">ВУЗ</th>
                                <th style="color: aliceblue">Время</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list sortedProducts as product>
                                <tr>
                                    <th>${product_index + 1}</th>
                                    <th>${product.title}</th>
                                    <th>${product.university}</th>
                                    <th>${product.hours}</th>
                                </tr>
                            <#else>
                                <h3>Пользователей нет</h3>
                            </#list>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--/row-->

            <a id="layouts"></a>
            <hr>
            <h2 class="sub-header">Университеты</h2>
            <div class="row mb-3">

                <div class="col-lg-6">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" href="#home1" role="tab" data-toggle="tab">БГУ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#profile1" role="tab" data-toggle="tab">БГУИР</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#messages1" role="tab" data-toggle="tab">БНТУ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#settings1" role="tab" data-toggle="tab">МГЛУ</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <br>
                        <div role="tabpanel" class="tab-pane active" id="home1">
                            <h4>БГУ</h4>
                            <p>
                                Белорусский государственный университет


                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile1">
                            <h4>БГУИР</h4>
                            <p>
                                Белорусский государственный университет информатики и радиоэлектроники
                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="messages1">
                            <h4>БНТУ</h4>
                            <p>
                                Белорусский национальный технический университет
                            </p>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="settings1">
                            <h4>МГЛУ</h4>
                            <p>
                                Минский государственный лингвистический университет
                            </p>
                        </div>
                    </div>
                </div>

<#--                <!--/col&ndash;&gt;-->
<#--                <div class="col-lg-6">-->
<#--                    <div id="accordion" role="tablist" aria-multiselectable="true">-->
<#--                        <div class="card">-->
<#--                            <div class="card-header" role="tab" id="headingOne" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">-->
<#--                                Collapsible Group Item #1-->
<#--                            </div>-->
<#--                            <div id="collapseOne" class="card-block collapse in" role="tabpanel" aria-labelledby="headingOne">-->
<#--                                <p>This is a Bootstrap 4 accordion that uses the <code>.card</code> classes instead of <code>.panel</code>. The single-open section aspect is not working because the parent option (dependent on .panel) has not yet been finalized in BS 4-->
<#--                                    alpha. </p>-->
<#--                            </div>-->
<#--                            <div class="card-header" role="tab" id="headingTwo" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">-->
<#--                                Collapsible Group Item #2-->
<#--                            </div>-->
<#--                            <div id="collapseTwo" class="card-block collapse" role="tabpanel" aria-labelledby="headingTwo">-->
<#--                                <p>Just like it's predecesor, Bootstrap 4 is mobile-first so that you start by designing for smaller devices such as smartphones and tablets, then proceed to laptop and desktop layouts.</p>-->
<#--                            </div>-->
<#--                            <div class="card-header" role="tab" id="headingThree" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">-->
<#--                                Collapsible Group Item #3-->
<#--                            </div>-->
<#--                            <div id="collapseThree" class="card-block collapse" role="tabpanel" aria-labelledby="headingThree">-->
<#--                                <p>Bootstrap employs a handful of important global styles and settings that you’ll need to be aware of when using it, all of which are almost exclusively geared towards the normalization of cross browser styles.</p>-->
<#--                            </div>-->
<#--                        </div>-->
<#--                    </div>-->
<#--                </div>-->
                <!--/col-->
            </div>
            <!--/row-->

        </div>
        <!--/main col-->
    </div>

</div>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                This is a dashboard layout for Bootstrap 4. This is an example of the Modal component which you can use to show content. Any content can be placed inside the modal and it can use the Bootstrap grid classes.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary-outline" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script>
    // sandbox disable popups
    if (window.self !== window.top && window.name != "view1") {
        window.alert = function() {
            /*disable alert*/
        };
        window.confirm = function() {
            /*disable confirm*/
        };
        window.prompt = function() {
            /*disable prompt*/
        };
        window.open = function() {
            /*disable open*/
        };
    }

    // prevent href=# click jump
    document.addEventListener(
        "DOMContentLoaded",
        function() {
            var links = document.getElementsByTagName("A");
            for (var i = 0; i < links.length; i++) {
                if (links[i].href.indexOf("#") != -1) {
                    links[i].addEventListener("click", function(e) {
                        console.debug("prevent href=# click");
                        if (this.hash) {
                            if (this.hash == "#") {
                                e.preventDefault();
                                return false;
                            } else {
                                /*
                                    var el = document.getElementById(this.hash.replace(/#/, ""));
                                    if (el) {
                                      el.scrollIntoView(true);
                                    }
                                    */
                            }
                        }
                        return false;
                    });
                }
            }
        },
        false
    );
</script>

<!--scripts loaded here-->

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>


<script>
    $(document).ready(function() {
        $("[data-toggle=offcanvas]").click(function() {
            $(".row-offcanvas").toggleClass("active");
        });
    });
</script>

</body>

</@t.template>
<@f.template user>

</@f.template>