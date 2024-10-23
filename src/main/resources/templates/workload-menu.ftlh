<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Учебная нагрузка</h1>
    <hr>
    <br>
    <div style="text-align: center">

        <br>
        <br>

        <#if user.isAdmin()>
            <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"
               href="/admin">
                Пользователи
            </a><br>
            <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"
               href="/my/products">
                Предметы
            </a><br>
            <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"
               href="/universities">
                Университеты
            </a><br>
            <a class="btn btn-dark mb-3 textureY" style="text-align: center; width: 100%"
               href="/workload">
                Добавить нагрузку
            </a><br>

            <#else>
                <h1 style="text-align: center">Упс, кажется у вас нет доступа:(</h1>

        </#if>
    </div>
</@t.template>