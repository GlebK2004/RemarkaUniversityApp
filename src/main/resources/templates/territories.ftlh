<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>

    <h1 style="text-align: center">Территории</h1>
    <hr>
    <button class="btn btn-dark mt-3 mb-3 for-button" style="text-align: center; width: 100%"
            data-toggle="collapse" data-target="#collapseExample1"
            aria-expanded="true" aria-controls="collapseExample">
        Добавить новый адрес
    </button>
    <div class="collapse mb-3" id="collapseExample1" style="">
        <form action="/territory/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="territoryName">Название улицы</label>
                <input type="text" required class="form-control"
                       id="territoryName" name="name">
            </div>

            <div class="form-group">
                <label for="territoryCity">Город </label>
                <input type="text" required class="form-control"
                       id="territoryCity" name="city">
            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Фотография</label>
                </div>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-light for-button">Добавить</button>
        </form>
    </div>

    <div class="card-columns">
        <#list Territories as territory>
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
                    <form action="/territory/delete/${territory.id}" method="post" style="margin-top: auto; text-align: right;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger for-button">
                            Удалить
                        </button>
                    </form>
                </div>
            </div>

<#--            </a>-->
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>


</@t.template>

<@f.template user>
</@f.template>