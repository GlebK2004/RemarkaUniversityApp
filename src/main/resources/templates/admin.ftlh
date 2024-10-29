<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    `<h1 style="text-align: center">Панель администратора</h1><hr>
     <div style="text-align: center">
    <br><button class="btn btn-dark mb-3 for-button" style="text-align: center; width: 50%;" onclick="location.href='/dashboard'">
    Аналитика
</button><br>
    </div>

    <table class="table table-hover table-dark">
        <thead>
        <tr>
            <th scope="col">Email</th>
            <th scope="col">Номер телефона</th>
            <th scope="col">Активность</th>
            <th scope="col">Роли</th>
            <th scope="col">Бан</th>
            <th scope="col">Редактирование</th>
            <th scope="col">Подробная информация</th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.phoneNumber}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td><#list user.roles as role>${role}<#if role_has_next>, </#if></#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post" style="display:inline;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" class="btn btn-danger btn-sm" value="Бан">
                    </form>
                </td>
                <td><button class="btn btn-light for-button" onclick="location.href='/admin/user/edit/${user.id}'">Редактирование</button></td>
                <td><button class="btn btn-info btn-light for-button" onclick="location.href='/user/${user.id}'">Подробная информация</button></td>
            </tr>
        <#else>
            <tr>
                <td colspan="7" class="text-center"><h3>Пользователей нет</h3></td>
            </tr>
        </#list>
        </tbody>
    </table>

<br>
    <h2 style="text-align: center">Отправка email-а:</h2><hr>
    <br>
<div class="container-fluid d-flex" style="height: 60vh;">
    <div class="col-md-6 d-flex align-items-center justify-content-center">
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
    </div>
    <div class="col-md-6 d-flex align-items-center justify-content-center">
        <img src="/static/images/email.png" alt="Описание картинки" style="width: 70%; height: auto;"> <!-- Замените на свой путь к изображению -->
    </div>
</div>
<div style="text-align: center">
    <button id="myButton" type="submit" style="width: 50%" class="btn btn-dark for-button">Отправить</button>
</div>
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
