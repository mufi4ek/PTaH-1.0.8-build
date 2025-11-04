# Знайти файл AMBuilder у репозиторії
$ambFile = Get-ChildItem -Recurse -File -Filter AMBuilder | Select-Object -First 1

if (-not $ambFile) {
  Write-Host "❌ Файл AMBuilder не знайдено"
  exit 1
}

# Перейти в директорію, де лежить AMBuilder
$ambDir = $ambFile.Directory.FullName
Write-Host "📂 Переходимо в: $ambDir"
Set-Location $ambDir

# Запустити білд
Write-Host "🚀 Запускаємо ambuild ."
ambuild .
