<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>
    <h1 style="text-align: center">Учебные курсы</h1>
    <hr>

    <#if user.isAdmin()>
        <button class="btn btn-dark mt-3 mb-3 for-button" style="text-align: center; width: 100%"
                data-toggle="collapse" data-target="#collapseExample" aria-expanded="true"
                aria-controls="collapseExample">
            Добавить новый курс
        </button>
    <div class="collapse mb-3" id="collapseExample" style="">

        <form action="/course/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="courseName">Номер группы</label>
                <input type="text" required class="form-control"
                       id="courseName" name="title">
            </div>
            <div class="form-group">
                <label for="hours">Количество часов</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="hours" name="hours">
                    <div class="input-group-append">
                        <span class="input-group-text">ч.</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchCity">ВУЗ</label>
                <select id="searchCity" required name="territory" class="form-control">
                    <option value="">ВУЗ выбран</option>

                    <option value="БГУИР">БГУИР</option>
                    <option value="БГУ">БГУ</option>
                    <option value="БНТУ">БНТУ</option>

                </select>
            </div>
            <div class="form-group">
                <label for="description">Описание курса</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Вторая фотография</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третья фотография</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark for-button">Добавить</button>
        </form>
        </#if>
    </div>

    <div class="card-columns">
        <#list courses as course>
<#--            <a href="/territory/${territory.id}" class="course-link">-->
            <div class="card text-white bg-dark my-3 course textureCard" style="height: 400px;"> <!-- Установите нужную высоту -->
                <div class="card-top">
                    <img src="/images/${course.previewImageId}" class="card-img-top" style="height: 200px; object-fit: cover;"> <!-- Задайте нужную высоту -->
                </div>

                <div class="card-body" style="display: flex; flex-direction: column; justify-content: space-between; padding-bottom: 10px; position: relative; height: 200px;">
                    <div>
                        <h5 class="card-title">${course.title}</h5>
                        <p class="card-text">${course.hours} ч.</p>
                    </div>
                    <form action="/course/delete/${course.id}" method="post" style="margin-top: auto; text-align: right;">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-danger for-button">
                            Удалить
                        </button>
                    </form>
                </div>
            </div>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>

<@f.template user>
</@f.template>