#!/bin/bash

# Script para verificar integridade dos recursos externos e HTTPS
# Execute este script antes do deploy para garantir que tudo está seguro

echo "🔒 VERIFICAÇÃO DE SEGURANÇA E HTTPS - Moreirart.ie"
echo "=================================================="

# Verificar se CNAME está correto
echo "1. Verificando CNAME..."
if grep -q "moreirart.ie" CNAME; then
    echo "✅ CNAME configurado corretamente: moreirart.ie"
else
    echo "❌ ERRO: CNAME não configurado ou incorreto"
    exit 1
fi

# Verificar se base href usa HTTPS
echo "2. Verificando base href..."
if grep -q 'base href="https://moreirart.ie/"' index.html; then
    echo "✅ Base href configurado para HTTPS"
else
    echo "❌ ERRO: Base href não usa HTTPS"
    exit 1
fi

# Verificar headers de segurança no HTML
echo "3. Verificando headers de segurança no HTML..."
if grep -q "X-Content-Type-Options" index.html; then
    echo "✅ Headers de segurança presentes no HTML"
else
    echo "❌ ERRO: Headers de segurança ausentes"
    exit 1
fi

# Verificar .htaccess
echo "4. Verificando .htaccess..."
if grep -q "Strict-Transport-Security" .htaccess; then
    echo "✅ Headers HSTS configurados no .htaccess"
else
    echo "❌ ERRO: HSTS não configurado"
    exit 1
fi

# Verificar links externos
echo "5. Verificando links externos..."
external_links_secure=$(grep -c 'rel="noopener noreferrer"' index.html)
if [ "$external_links_secure" -ge 3 ]; then
    echo "✅ Links externos protegidos ($external_links_secure encontrados)"
else
    echo "❌ ERRO: Links externos podem não estar protegidos"
fi

# Verificar CSS compilado
echo "6. Verificando CSS compilado..."
if [ -f "dist/styles.min.css" ]; then
    echo "✅ CSS compilado encontrado"
else
    echo "⚠️  AVISO: Execute 'npm run build:css' antes do deploy"
fi

# Verificar manifest
echo "7. Verificando Web App Manifest..."
if grep -q "https://moreirart.ie" assets/favicon/site.webmanifest; then
    echo "✅ Manifest configurado para HTTPS"
else
    echo "❌ ERRO: Manifest não usa HTTPS"
    exit 1
fi

echo ""
echo "🎉 VERIFICAÇÃO COMPLETA!"
echo "📋 PRÓXIMOS PASSOS:"
echo "   1. Execute: npm run build:css"
echo "   2. Teste localmente"
echo "   3. Faça commit e push"
echo "   4. Configure GitHub Pages com HTTPS"
echo "   5. Teste: https://moreirart.ie"
echo ""
echo "🔗 FERRAMENTAS DE TESTE:"
echo "   • SSL Test: https://www.ssllabs.com/ssltest/"
echo "   • Security Headers: https://securityheaders.com/"
echo "   • PageSpeed: https://pagespeed.web.dev/"
