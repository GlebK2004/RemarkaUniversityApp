<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
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
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product texture">

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

    <br>
    <hr>

    <div class="d-flex justify-content-center" style="width: 100%;">
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px;" type="button"
                onclick="window.location.href = '/about-us'">О нас</button>
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px; " type="button"
                onclick="window.location.href = '/dashboard2'">Наши преимущества</button>
        <button class="btn btn-light mx-2 for-button" style="flex-grow: 1; height: 50px;" type="button"
                onclick="window.location.href = '/location'">Как нас найти</button>
    </div>

<#--    <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"-->
<#--       href="/dashboard2">-->
<#--        Наши преимущества-->
<#--    </a>-->

</@t.template>
<@f.template user>

</@f.template>