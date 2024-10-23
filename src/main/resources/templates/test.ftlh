<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email</title>
</head>
<body>
<h1>Send Email</h1>
<form id="emailForm">
    <label for="to">To:</label>
    <input type="email" id="to" name="to" required><br><br>
    <label for="subject">Subject:</label>
    <input type="text" id="subject" name="subject" required><br><br>
    <label for="text">Message:</label><br>
    <textarea id="text" name="text" rows="4" cols="50" required></textarea><br><br>
    <button type="submit">Send Email</button>
</form>

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
</body>
</html>
