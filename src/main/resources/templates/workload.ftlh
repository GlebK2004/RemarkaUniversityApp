<#import "blocks/template.ftlh" as t>
<@t.template user>

    <h1> Выберите преподавателя: </h1>
    <br><br>
    <table class="table table-hover table-dark texture">
        <tr class="textureY">
            <th scope="col">Имя</th>
            <th scope="col">Email</th>
            <th scope="col">Телефон</th>
            <th scope="col">Выбрать</th>
        </tr>
        <#list users as user1>
            <#if !user1.isAdmin()>
            <tr>
                <th>${user1.name}</th>
                <th>${user1.email}</th>
                <th>${user1.phoneNumber}</th>
                <th> <button class="btn btn-light my-2 my-sm-0 ml-auto mr-2 textureY"
                             onclick="window.location.href = '/add-workload/${user1.id}'">✓</button>
                </th>
            </tr>
            </#if>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>

</@t.template>