<#import "blocks/template.ftlh" as t>
<#import "blocks/footer.ftlh" as f>
<@t.template user>

<#--    <h1>Мое видео на YouTube</h1>-->
<#--    <iframe width="560" height="315" src="https://www.youtube.com/watch?v=qoaLdCdZOfc" frameborder="0" allowfullscreen></iframe>-->

    <h1>Кто посмотрел, тот ставит 10</h1>
    <br>
    <div id="player1"></div>
    <div id="player2"></div>
    <div id="player3"></div>

    <script>
        // Загрузка API YouTube
        function onYouTubeIframeAPIReady() {
            // Создание плеера
            new YT.Player('player1', {
                height: '360',
                width: '640',
                videoId: 'qoaLdCdZOfc', // Замените на реальный ID вашего видео
                playerVars: {
                    'autoplay': 1 // Включаем автовоспроизведение
                },
                // events: {
                //     'onReady': onPlayerReady
                // }
            });
            new YT.Player('player2', {
                height: '360',
                width: '640',
                videoId: 'QHDjJcCoohg', // Замените на реальный ID вашего видео
                playerVars: {
                    'autoplay': 1 // Включаем автовоспроизведение
                },
                events: {
                    'onReady': onPlayerReady
                }
            });
            // Создание плеера
            new YT.Player('player3', {
                height: '360',
                width: '640',
                videoId: 'HMTKMWHLbdQ', // Замените на реальный ID вашего видео
                playerVars: {
                    'autoplay': 0 // Отключаем автовоспроизведение
                },
                events: {
                    'onReady': onPlayerReady
                }
            });
        }

        function onPlayerReady(event) {
            // Добавляем обработчик события клика на кнопку воспроизведения
            document.getElementById('playButton').addEventListener('click', function() {
                event.target.playVideo();
            });
        }

    </script>
    <script src="https://www.youtube.com/iframe_api"></script>
    <br>
    <br>

</@t.template>
<@f.template f>

</@f.template>