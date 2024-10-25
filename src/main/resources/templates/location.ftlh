<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>

    <h1 style="text-align: center">Где мы находимся</h1>
    <hr>
    <br>

</@t.template>

<div style="display: flex; align-items: flex-start; margin-top: 100px;">
    <div style="margin-right: 20px; margin-left: 100px"> <!-- Отступ между блоками -->
        <h2>Наш адрес:</h2>
        <h3>Немига, 5, ТЦ «Метрополь»</h3><br>
           <h3 style="font-weight: normal"> Рядом «ЛИДО», можно перекусить,<br>
            а заодно пройтись по магазинам или погулять по ул. Революционной
        </h3>
        <img src="/static/images/Стрелка.png" alt="Strelka" style="width: 80%">
    </div>
    <div style="margin-right: 30px">
        <script type="text/javascript" charset="utf-8"
                async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A12fe0d4ed2b1dfd693affff56b96274bf04c2482ae1b3dcb64394ee7d41f9631&amp;width=840&amp;height=468&amp;lang=ru_RU&amp;scroll=true">
        </script>
    </div>
</div>
<@f.template f>

</@f.template>