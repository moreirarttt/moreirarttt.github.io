# Script PowerShell para verificar segurança e HTTPS
# Execute: .\check-security.ps1

Write-Host "VERIFICACAO DE SEGURANCA E HTTPS - Moreirart.ie" -ForegroundColor Cyan
Write-Host "=================================================" -ForegroundColor Cyan

$errorCount = 0

# Verificar se CNAME está correto
Write-Host "1. Verificando CNAME..." -ForegroundColor Yellow
if (Get-Content "CNAME" | Select-String "moreirart.com") {
    Write-Host "OK: CNAME configurado corretamente: moreirart.com" -ForegroundColor Green
} else {
    Write-Host "ERRO: CNAME nao configurado ou incorreto" -ForegroundColor Red
    $errorCount++
}

# Verificar se base href é relativo
Write-Host "2. Verificando base href..." -ForegroundColor Yellow
if (Get-Content "index.html" | Select-String "base href=`"/`"") {
    Write-Host "OK: Base href configurado como relativo" -ForegroundColor Green
} else {
    Write-Host "ERRO: Base href nao esta configurado como relativo" -ForegroundColor Red
    $errorCount++
}

# Verificar headers de segurança no HTML
Write-Host "3. Verificando headers de segurança no HTML..." -ForegroundColor Yellow
if (Get-Content "index.html" | Select-String "X-Content-Type-Options") {
    Write-Host "OK: Headers de seguranca presentes no HTML" -ForegroundColor Green
} else {
    Write-Host "ERRO: Headers de seguranca ausentes" -ForegroundColor Red
    $errorCount++
}

# Verificar .htaccess
Write-Host "4. Verificando .htaccess..." -ForegroundColor Yellow
if (Get-Content ".htaccess" | Select-String "Strict-Transport-Security") {
    Write-Host "OK: Headers HSTS configurados no .htaccess" -ForegroundColor Green
} else {
    Write-Host "ERRO: HSTS nao configurado" -ForegroundColor Red
    $errorCount++
}

# Verificar links externos
Write-Host "5. Verificando links externos..." -ForegroundColor Yellow
$externalLinksCount = (Get-Content "index.html" | Select-String "noopener noreferrer").Count
if ($externalLinksCount -ge 3) {
    Write-Host "OK: Links externos protegidos ($externalLinksCount encontrados)" -ForegroundColor Green
} else {
    Write-Host "AVISO: Links externos podem nao estar protegidos" -ForegroundColor Yellow
}

# Verificar CSS compilado
Write-Host "6. Verificando CSS compilado..." -ForegroundColor Yellow
if (Test-Path "dist\styles.min.css") {
    Write-Host "OK: CSS compilado encontrado" -ForegroundColor Green
} else {
    Write-Host "AVISO: Execute npm run build:css antes do deploy" -ForegroundColor Yellow
}

Write-Host ""
if ($errorCount -eq 0) {
    Write-Host "VERIFICACAO COMPLETA - TUDO OK!" -ForegroundColor Green
} else {
    Write-Host "ENCONTRADOS $errorCount ERRO(S) - CORRIJA ANTES DO DEPLOY" -ForegroundColor Red
}

Write-Host ""
Write-Host "PROXIMOS PASSOS:" -ForegroundColor Cyan
Write-Host "   1. Execute: npm run build:css" -ForegroundColor White
Write-Host "   2. Teste localmente" -ForegroundColor White
Write-Host "   3. Faca commit e push" -ForegroundColor White
Write-Host "   4. Configure GitHub Pages com HTTPS" -ForegroundColor White
Write-Host "   5. Teste: https://moreirart.com" -ForegroundColor White
Write-Host ""
Write-Host "FERRAMENTAS DE TESTE:" -ForegroundColor Cyan
Write-Host "   SSL Test: https://www.ssllabs.com/ssltest/" -ForegroundColor White
Write-Host "   Security Headers: https://securityheaders.com/" -ForegroundColor White
Write-Host "   PageSpeed: https://pagespeed.web.dev/" -ForegroundColor White
