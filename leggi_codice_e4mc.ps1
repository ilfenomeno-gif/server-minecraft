$logPath = Join-Path $PSScriptRoot "logs\latest.log"
if (Test-Path $logPath) {
    $line = Get-Content $logPath | Where-Object { $_ -match "Domain assigned:\s*([a-zA-Z0-9.-]+)" } | Select-Object -Last 1
    if ($line -match "Domain assigned:\s*([a-zA-Z0-9.-]+)") {
        $address = $Matches[1]
        Write-Host ""
        Write-Host "===================================================" -ForegroundColor Cyan
        Write-Host "  INDIRIZZO E4MC PER LA CONNESSIONE DEI GIOCATORI  " -ForegroundColor Cyan
        Write-Host "===================================================" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Indirizzo Server: $address" -ForegroundColor Green
        Write-Host ""
        Set-Clipboard -Value $address
        Write-Host "-> L'indirizzo e stato copiato automaticamente negli appunti!" -ForegroundColor Yellow
        Write-Host "-> Puoi incollarlo direttamente in Minecraft (Direct Connection o Add Server)." -ForegroundColor Gray
        Write-Host ""
    } else {
        Write-Host "Nessun dominio e4mc trovato in logs\latest.log. Il server e stato avviato?" -ForegroundColor Red
    }
} else {
    Write-Host "File logs\latest.log non ancora presente. Avvia prima il server con avvia.bat." -ForegroundColor Red
}
