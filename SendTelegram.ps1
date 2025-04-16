param (
    [string]$Status = "Ок"
)
# Параметры бота
$token = "токен"
$chat_id = "id"
$url = "https://api.telegram.org/bot$token/sendMessage"

# Дата и сообщение
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$status = "Успех неизбежен!"
$message = "[$time] ✅ Калибровка печки №1 завершена успешно. Статус: $Status"

# Формирование строк для записи в лог:
$logMessage1 = "[$time] ✅ Калибровка печки №1 завершена успешно."
$logMessage2 = "Статус: $status"

# Объект запроса
$payload = @{
    chat_id = $chat_id
    text    = $message
}

# Сформировать JSON
$jsonPayload = @{ chat_id = $chatId; text = $message } | ConvertTo-Json -Compress

# Преобразовать в UTF-8 без BOM
$json = $payload | ConvertTo-Json -Compress

# Преобразование в UTF-8 JSON
$json = $payload | ConvertTo-Json -Compress
$utf8 = [System.Text.Encoding]::UTF8.GetBytes($json)

# Логирование
$logFile = "log.txt" # путь к файлу для логирования
$logMessage = "[$time]`n - JSON отправки: $json"
#Add-Content -Path $logFile -Value $logMessage

# Запись в файл в правильной кодировке
[System.IO.File]::AppendAllText($logFile, "$logMessage1`r`n$logMessage2`r`n", [System.Text.Encoding]::UTF8)


# Преобразование в JSON (формируем правильный JSON)
$jsonPayload = $payload | ConvertTo-Json -Compress

# Логирование JSON для проверки
Write-Host "Сериализованный JSON: $jsonPayload"


try {
    # Отправка запроса
    $response = Invoke-WebRequest -Uri $url `
                              -Method POST `
                              -Body ($payload | ConvertTo-Json -Compress) `
                              -ContentType "application/json; charset=utf-8" `
                              -UseBasicParsing `
                              -Headers @{ "Accept-Charset" = "utf-8" } | Out-Null

    Write-Host "✅ Отправлено. Ответ:"
    Write-Host $response.Content

     # Логирование успешной отправки
#    $responseLog = "[$time] - Статус отправки: Успех неизбежен!"
#    $responseLog | Out-File -Append -FilePath $logFile
    [System.IO.File]::AppendAllText($logFile, "$responseLog`r`n", [System.Text.Encoding]::UTF8)
}
catch {
    Write-Error "❌ Ошибка отправки: $($_.Exception.Message)"

    # Логирование ошибки
#    $errorLog = "[$time] - Статус отправки: Ошибка - $($_.Exception.Message)"
    $errorLog | Out-File -Append -FilePath $logFile
    [System.IO.File]::AppendAllText($logFile, "$errorLog`r`n", [System.Text.Encoding]::UTF8)
}
