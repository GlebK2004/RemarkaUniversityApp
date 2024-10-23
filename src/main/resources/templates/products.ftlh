<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    <h1 style="text-align: center">Поиск дисциплины</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">ВУЗ</label>
                <select id="searchCity" class="form-control">
                    <option value="">ВУЗ не выбран</option>
                    <option value="БГУ">БГУ</option>
                    <option value="БГУИР">БГУИР</option>
                    <option value="БНТУ">БНТУ</option>
                </select>


            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Поиск</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%" type="submit" class="btn btn-dark texture">Поиск</button>
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
                        ${product.university}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>

    <br>
    <hr>
    <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"
       href="/dashboard2">
        Наши преимущества
    </a><br>

</@t.template>
<@f.template user>

</@f.template>