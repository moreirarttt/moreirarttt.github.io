# Script PowerShell para verificar segurança e HTTPS
# Execute: .\check-security.ps1

Write-Host "🔒 VERIFICAÇÃO DE SEGURANÇA E HTTPS - Moreirart.ie" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan

$errorCount = 0

# Verificar se CNAME está correto
Write-Host "1. Verificando CNAME..." -ForegroundColor Yellow
if (Select-String -Path "CNAME" -Pattern "moreirart.com" -Quiet) {
    Write-Host "✅ CNAME configurado corretamente: moreirart.com" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: CNAME não configurado ou incorreto" -ForegroundColor Red
    $errorCount++
}

# Verificar se base href usa URL relativa (mais compatível para dev e prod)
Write-Host "2. Verificando base href..." -ForegroundColor Yellow
if (Select-String -Path "index.html" -Pattern "base href=`"/`"" -Quiet) {
    Write-Host "✅ Base href configurado corretamente como relativo" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: Base href não está configurado como relativo" -ForegroundColor Red
    $errorCount++
}

# Verificar headers de segurança no HTML
Write-Host "3. Verificando headers de segurança no HTML..." -ForegroundColor Yellow
if (Select-String -Path "index.html" -Pattern "X-Content-Type-Options" -Quiet) {
    Write-Host "✅ Headers de segurança presentes no HTML" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: Headers de segurança ausentes" -ForegroundColor Red
    $errorCount++
}

# Verificar .htaccess
Write-Host "4. Verificando .htaccess..." -ForegroundColor Yellow
if (Select-String -Path ".htaccess" -Pattern "Strict-Transport-Security" -Quiet) {
    Write-Host "✅ Headers HSTS configurados no .htaccess" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: HSTS não configurado" -ForegroundColor Red
    $errorCount++
}

# Verificar links externos
Write-Host "5. Verificando links externos..." -ForegroundColor Yellow
$externalLinksCount = (Select-String -Path "index.html" -Pattern "rel=`"noopener noreferrer`"" -AllMatches).Matches.Count
if ($externalLinksCount -ge 3) {
    Write-Host "✅ Links externos protegidos ($externalLinksCount encontrados)" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: Links externos podem não estar protegidos" -ForegroundColor Red
}

# Verificar CSS compilado
Write-Host "6. Verificando CSS compilado..." -ForegroundColor Yellow
if (Test-Path "dist\styles.min.css") {
    Write-Host "✅ CSS compilado encontrado" -ForegroundColor Green
} else {
    Write-Host "⚠️ AVISO: Execute npm run build:css antes do deploy" -ForegroundColor Yellow
}

# Verificar manifest
Write-Host "7. Verificando Web App Manifest..." -ForegroundColor Yellow
if (!(Select-String -Path "assets\favicon\site.webmanifest" -Pattern "https://" -Quiet)) {
    Write-Host "✅ Manifest usa URLs relativas (compatível com dev/prod)" -ForegroundColor Green
} else {
    Write-Host "❌ ERRO: Manifest usa URLs absolutas (pode quebrar em desenvolvimento)" -ForegroundColor Red
    $errorCount++
}

Write-Host ""
if ($errorCount -eq 0) {
    Write-Host "🎉 VERIFICAÇÃO COMPLETA - TUDO OK!" -ForegroundColor Green
} else {
    Write-Host "⚠️  ENCONTRADOS $errorCount ERRO(S) - CORRIJA ANTES DO DEPLOY" -ForegroundColor Red
}

Write-Host ""
Write-Host "📋 PRÓXIMOS PASSOS:" -ForegroundColor Cyan
Write-Host "   1. Execute: npm run build:css" -ForegroundColor White
Write-Host "   2. Teste localmente" -ForegroundColor White
Write-Host "   3. Faça commit e push" -ForegroundColor White
Write-Host "   4. Configure GitHub Pages com HTTPS" -ForegroundColor White
Write-Host "   5. Teste: https://moreirart.com" -ForegroundColor White
Write-Host ""
Write-Host "🔗 FERRAMENTAS DE TESTE:" -ForegroundColor Cyan
Write-Host "   • SSL Test: https://www.ssllabs.com/ssltest/" -ForegroundColor White
Write-Host "   • Security Headers: https://securityheaders.com/" -ForegroundColor White
Write-Host "   • PageSpeed: https://pagespeed.web.dev/" -ForegroundColor White
