<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    `<h1 style="text-align: center">Панель администратора</h1><hr>

    <br><a class="btn btn-dark mb-3 textureY" style="text-align: center; width: 100%"
       href="/dashboard">
        Аналитика
    </a><br>

    <table class="table table-hover table-dark">
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роли</th>
            <th scope="col">Бан</th>
            <th scope="col">Редактирование</th>
            <th scope="col">Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-light textureY" value="Бан">
                    </form>
                </th>
                <th><a class = "textured-textY" href="/admin/user/edit/${user.id}">Редактировние</a></th>
                <th><a class = "textured-textY" href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>

<br>
    <h2 style="text-align: center">Отправка email-а:</h2><hr>
    <br>
    <form id="emailForm" action="/send-email" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="to">Кому:</label>
            <input type="email" required class="form-control" id="to" name="to">
        </div>
        <div class="form-group">
            <label for="subject">Тема:</label>
            <input type="text" id="subject" name="subject" required class="form-control">
        </div>
        <div class="form-group">
            <label for="text">Текст:</label><br>
            <textarea id="text" name="text" rows="4" cols="50" required class="form-control"></textarea>
        </div>
<#--        <button type="submit" style="width: 100%" class="btn btn-dark texture">Отправить</button>-->
    </form>

    <button id="myButton" type="submit" style="width: 100%" class="btn btn-dark texture">Отправить</button>

    <script>
        document.getElementById("myButton").addEventListener("click", function() {
            var notification = document.createElement("div");
            notification.className = "notification";
            notification.textContent = "Уведомление отправлено!";
            document.body.appendChild(notification);
            setTimeout(function() {
                notification.style.display = "block";
            }, 100);
        });
    </script>
    <br>
    <br>

    <script>
        document.getElementById("emailForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Предотвращаем отправку формы по умолчанию

            var formData = new FormData(this); // Создаем объект FormData из данных формы

            fetch('/send-email', { // Отправляем запрос POST на /send-email
                method: 'POST',
                body: formData // Передаем данные формы в теле запроса
            })
            // .then(response => response.text()) // Получаем текст ответа
            // .then(data => alert(data)); // Отображаем текст ответа в модальном окне
        });
    </script>

</@t.template>
<@f.template user>

</@f.template>
