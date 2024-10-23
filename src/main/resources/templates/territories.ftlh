<#import "blocks/template.ftlh" as t>
<@t.template user>

    <h1 style="text-align: center">Территории</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3 texture" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample1" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый адресс
    </a>
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

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
    </div>

    <div class="card-columns">
        <#list Territories as territory>
<#--            <a href="/territory/${territory.id}" class="product-link">-->
                <div class="card text-white bg-dark my-3 product texture">
                    <div class="card-top">
                        <form action="/territory/delete/${territory.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn m-3 textureY">
                                Удалить
                            </button>
                        </form>
                    </div>

                    <div class="card-body">
                        <img src="/image_u/${territory.previewImageId}"
                             class="card-img-top">
                        <h5 class="card-title">${territory.name}</h5>
                        <p class="card-text">${territory.city} </p>
                    </div>
                </div>
<#--            </a>-->
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>


</@t.template>