<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template admin>

    <h1> Выберите учебную дисциплину: </h1>
    <br>
    <div class="card-columns">
        <#list products as product>
            <a>
                <div class="card text-white bg-dark my-3 product">
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.hours} ч.</p>
                    </div>
                    <div class="card-footer">

<#--                        <form  action="/add-workload/done" method="post" enctype="multipart/form-data">-->
<#--                            <input type="hidden" name="productTitle" id="productTitle" value="${product.title}" />-->
<#--                            <input type="hidden" name="user" id ="user" value="${user}" />-->
<#--                        <button id="myButton" class="btn btn-light my-2 my-sm-0 ml-auto mr-2 textureY">✓</button>-->
<#--                            -->
<#--                        </form>-->
                        <button id="myButton"  type="submit" class="btn btn-light my-2 my-sm-0 ml-auto mr-2 textureY">✓</button>
                        <script>
                            document.getElementById("myButton").addEventListener("click", function() {
                                var notification = document.createElement("div");
                                notification.className = "notification";
                                notification.textContent = "Предмет назначен!";
                                document.body.appendChild(notification);
                                setTimeout(function() {
                                    notification.style.display = "block";
                                }, 100);
                            });
                        </script>
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>


    </div>

    <br>
    <a class="btn btn-dark mb-3 texture" style="text-align: center; width: 100%"
       href="/">
        Готово
    </a><br>

</@t.template>

<@f.template user>
</@f.template>