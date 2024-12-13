<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>

    <h1 style="text-align: center">Urban Lang Club</h1>
    <hr>

    <br>
    <br>
    <div class="slider">
        <div class="slide"><img src="/static/images/slider/023A9299.jpg" alt="Strelka"></div>
        <div class="slide"><img src="/static/images/slider/023A0171.jpg" alt="Strelka"></div>
        <div class="slide"><img src="/static/images/slider/023A0139.jpg" alt="Strelka"></div>
        <div class="slide"><img src="/static/images/slider/023A9348.jpg" alt="Strelka"></div>
    </div>

    <br>
    <h4> Urban Lang Club - специализированная школа, обучающая разговорным языкам по кембриджской методике
        Кембриджская методика - это методика изучения разговорного языка через погружение в языковую среду.
        Здесь нет скучных учебников и заучиваний правил: только моделирование ситуаций и постоянное общение.
        Да, экзамены TOEFL с таким подходом не сдашь, зато язык изучается в 5 раз быстрее, чем по классической модели.
        Уже через несколько месяцев вы начинаете свободно путешествовать, общаться с иностранцами или устраиваетесь на работу,
        где требуется владение языком.
        <br>
        <br>
        Школа ULC - одна из немногих в Минске, которая гарантирует результат по договору: либо Вы повышаете уровень языка
        за курс, либо проходите повторное обучение за счет школы (бесплатно).</h4>
    <hr>

    <div class="d-flex justify-content-center" style="width: 100%;">
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px;" type="button"
                onclick="window.location.href = '/about-us'">О нас</button>
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px; " type="button"
                onclick="window.location.href = '/dashboard'">Наши преимущества</button>
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px;" type="button"
                onclick="window.location.href = '/location'">Как нас найти</button>
    </div>

    <br><br><br><h1 style="text-align: center">Где проходят наши занятия?</h1><hr>

     <div class="card-columns">
        <#list territories as territory>
<#--            <a href="/territory/${territory.id}" class="course-link">-->
            <div class="card text-white bg-dark my-3 course textureCard" style="height: 400px;"> <!-- Установите нужную высоту -->
                <div class="card-top">
                    <img src="/image_u/${territory.previewImageId}" class="card-img-top" style="height: 200px; object-fit: cover;"> <!-- Задайте нужную высоту -->
                </div>

                <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 10px; position: relative; height: 200px;">
                    <div>
                        <h5 class="card-title">${territory.name}</h5>
                        <p class="card-text">${territory.city}</p>
                    </div>
                </div>
            </div>
            </#list>
     </div>

    <br><br>
    <h1 style="text-align: center">Найти группу</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">Где проходят занятия?</label>
                <select id="searchCity" class="form-control">
                    <option value="">Адрес</option>
                    <option value="БГУ">Интернациональная</option>
                    <option value="БГУИР">Короля</option>
                    <option value="БНТУ">Немига</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <button style="width: 30%" type="submit" class="btn btn-dark for-button">Поиск</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list courses as course>
        <#--            <a href="/territory/${territory.id}" class="course-link">-->
            <div class="card text-white bg-dark my-3 course textureCard1" style="height: 400px; "> <!-- Установите нужную высоту -->
                <div class="card-top">
                    <img src="/images/${course.previewImageId}" class="card-img-top" style="height: 200px; object-fit: cover;"> <!-- Задайте нужную высоту -->
                </div>

                <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 10px; position: relative; height: 200px;">
                    <div>
                        <h3 class="card-title">${course.title}</h3>
                        <p class="card-text" style="font-size: 1.5rem">${course.hours} ч.</p>
                        <p class="card-text" style="font-size: 1.5rem">${course.description}</p>
                    </div>

                </div>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>


    <br><br><h2 style="text-align: center">Где мы есть:</h2><hr>
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
    <br>
    <div style="text-align: right">
    <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px;" type="button"
            onclick="window.location.href = '/dashboard2'">Для руководства</button>
    </div>
</@t.template>
<@f.template user>
</@f.template>