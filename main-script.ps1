$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "🔥 Основной скрипт запущен! [$date]"

# Путь к лог-файлу
$logPath = "C:\Users\gladinov.s\Desktop\PowerShellTGbot\log.txt"

#Убеждаемся что папка существует
$logFolder = Split-Path $logPath
if (-not(Test-Path $logFolder)) {
    New-Item -ItemType Directory -Path $logFolder | Out-Null
}

#Запись в лог
try {
    "[$date] Скрипт отработал" | Out-File -Append -FilePath $logPath -Encoding UTF8
    Write-Host "Запись в лог выполнена: $logPath"
}
catch {
    Write-Host "Ошибка записи в лог: $($_.Exception.Message)"
}

#Запуск отправки сообщения я ТГ
$telegramScript = "C:\Users\gladinov.s\Desktop\PowerShellTGbot\SendTelegram.ps1"
if (Test-Path $telegramScript) {
    & $telegramScript
    Write-Host "Сообщение отправлено в ТГ"
}
else {
  Write-Host "Не найден SendTelegram.ps1 по пути: $telegramScript"

}

pause
