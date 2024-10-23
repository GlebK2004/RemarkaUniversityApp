<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Учебные предметы</h1>
    <hr>

    <#if user.isAdmin()>
    <a class="btn btn-dark mt-3 mb-3 texture" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Добавить новый предмет
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">

        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Название предмет</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="hours">Количество часов</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="hours" name="hours">
                    <div class="input-group-append">
                        <span class="input-group-text">ч.</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchCity">ВУЗ</label>
                <select id="searchCity" required name="territory" class="form-control">
                    <option value="">ВУЗ выбран</option>

                    <option value="БГУИР">БГУИР</option>
                    <option value="БГУ">БГУ</option>
                    <option value="БНТУ">БНТУ</option>

                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание предмета</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark texture">Добавить</button>
        </form>
        </#if>
    </div>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product texture">
                    <div class="card-top">
                        <form action="/product/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn m-3 textureY">
                                Удалить
                            </button>
                        </form>
                    </div>
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.hours} ч.</p>
                    </div>
                    <div class="card-footer">
                        ${product.territory}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>