param(
    [string]$Status = "Успешно",
    [string]$Operation = "Калибровка",
    [string]$Message = "Операция завершена успешно"
)

# Правильная кодировка UTF8
#[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$token = "7571011290:AAF0lrN90__wyghc4A16TCv19lz3v3fiEoI"
$chat_id = "279037700"

# Получаем время
$time = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Сообщение с временем и операцией
$logMessage = "[$time] [$Operation] → $Message`n"
$logMessage | Out-File -FilePath ".\log.txt" -Append -Encoding utf8

#Сохранить темновой кадр
$darkFrame = "RAW DATA OF DARK FRAME" # Данные из камеры
$darkFramePath = ".\dark_frame_$time.txt"
$darkFrame | Out-File -FilePath $darkFramePath -Encoding utf8

#Температура
$temperature = "Текущая температура: "
$temperature | Out-File -FilePath ".\temperature_log.txt" -Append -Encoding utf8

#Параметры для отправки в TG
$token = "7571011290:AAF0lrN90__wyghc4A16TCv19lz3v3fiEoI"
$chat_id = "279037700"
$logPath = ".\log.txt"

$url = "https://api.telegram.org/bot$token/sendMessage"
$body = @{
    chat_id = $chat_id
    text   = $Message
}

try
{
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $body
    Add-Content -Path ".\log.txt" -Value $logMessage
    Write-Host "Отчет отправлен и записан в log.txt"
}
catch {
    Write-Error "❌ ОШИБКА: $_"
    Add-Content -Path ".\log.txt" -Value "[$time] ❌ Ошибка: $_"
}
