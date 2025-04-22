# Параметры
$folderToWatch = "C:\Users\gladinov.s\Desktop\ass"
$targetFile = "Finish.txt"
$scriptToRun = "C:\Users\gladinov.s\Desktop\PowerShellTGbot\main-script.ps1"
$telegramScript = "C:\Users\gladinov.s\Desktop\PowerShellTGbot\SendTelegram.ps1"
$debugLog = "C:\Users\gladinov.s\Desktop\PowerShellTGbot\watch-log.txt"

Write-Host "⏳ Ожидание появления файла $targetFile в папке $folderToWatch..."

while ($true) {
    if (Test-Path "$folderToWatch\$targetFile") {
        $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "[$date] ✅ Обнаружен Finish.txt"

        # Логирование
        Add-Content $debugLog -Value "[$date] Обнаружен Finish.txt"

        # Запуск основного скрипта
        if (Test-Path $scriptToRun) {
            Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$scriptToRun`""
        } else {
            Write-Host "❌ main-script.ps1 не найден!"
        }

        # Запуск скрипта Telegram
        if (Test-Path $telegramScript) {
            Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$telegramScript`""
        } else {
            Write-Host "❌ SendTelegram.ps1 не найден!"
        }

        # Удаление файла
        Remove-Item "$folderToWatch\$targetFile" -Force
        Write-Host "[$date] 🗑️ Finish.txt удалён"

        Start-Sleep -Seconds 2
    }

    Start-Sleep -Seconds 1
}
