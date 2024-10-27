<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    <h1 style="text-align: center">Учебный центр</h1>
    <hr>
    <br>
    <div style="text-align: center">
        <br>

        <#if user.isAdmin()>
            <div class="container-fluid d-flex">
                <div class="col-md-4">
                    <div class="d-grid gap-4">
                        <br>
                        <button class="btn btn-dark mb-3 for-button" style="width: 100%" onclick="location.href='/admin'">
                            Преподаватели
                        </button>
                        <button class="btn btn-dark mb-3 for-button" style="width: 100%" onclick="location.href='/my/courses'">
                            Курсы
                        </button>
                        <button class="btn btn-dark mb-3 for-button" style="width: 100%" onclick="location.href='/territories'">
                            Территории
                        </button>
                        <div style="margin-top: 110px;">
                            <button class="btn btn-danger mb-3" style="width: 100%" onclick="location.href='/workload'">
                                Добавить нагрузку
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 d-flex align-items-center justify-content-start" style="height: 100%;">
                    <img src="/static/images/Стрелка3.png" alt="Описание картинки" style="max-width: 90%; height: auto;">
                </div>
                <div class="col-md-4 d-flex align-items-center justify-content-center" style="height: 100%;">
                   <br><br>
                    <a href="/">
                    <img src="/static/images/Новый%20лого.jpg" alt="logo" style="max-width: 90%; height: auto; max-height: 90vh; object-fit: contain;">
                    </a>
                </div>
            </div><hr>
            <br><br><br>
            <img src="/static/images/Сертификат2.png" alt="Сертификат" style="max-width: 75%; height: auto; max-height: 80vh; object-fit: contain;">
            <br>

            <#else>
                <br>
                <img src="/static/images/Сертификат2.png" alt="Сертификат" style="max-width: 50%; height: auto; max-height: 80vh; object-fit: contain;">
                <br>
                <br><br>
                <h1 style="text-align: center">Упс, кажется у вас нет доступа:(</h1>

        </#if>
    </div>
</@t.template>

<@f.template user>
</@f.template>