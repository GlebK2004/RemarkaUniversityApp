<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    <h1 style="text-align: center">Авторизация</h1>
    <hr>
    <div class="container-fluid d-flex" style="height: 40vh;">
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <form action="/login" method="post" style="width: 100%; max-width: 400px;"> <!-- Установлен максимальный размер формы -->
                <div class="form-group">
                    <label for="email">Электронная почта</label>
                    <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username" style="width: 100%;">
                    <div class="invalid-feedback">
                        Неверная электронная почта
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password" style="width: 100%;">
                    <div class="invalid-feedback">
                        Неверный пароль
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-dark for-button" style="width: 100%;">Войти</button>
            </form>
        </div>
        <div class="col-md-6 d-flex align-items-center justify-content-center">
            <img src="/static/images/reg.png" alt="Описание картинки" style="width: 50%; height: auto;"> <!-- Замените на свой путь к изображению -->
        </div>
    </div>
    <hr>
    <h2>Нет аккаунта? <a href="/registration">Зарегистрируйся!</a></h2>
</@t.template>

<@f.template user>
</@f.template>