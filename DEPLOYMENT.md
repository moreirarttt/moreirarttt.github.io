# Instruções de Implantação (Deployment) - Versão Segura HTTPS

Este documento contém instruções para otimizar e implantar o site do Moreirart com HTTPS e medidas de segurança.

## Pré-Requisitos

- Node.js (v14 ou superior)
- Domínio configurado (`moreirart.ie`)
- GitHub Pages com HTTPS habilitado

## 🔒 Checklist de Segurança HTTPS

### Antes do Deploy
- [ ] CNAME configurado para `moreirart.ie`
- [ ] Base href usa HTTPS: `https://moreirart.ie/`
- [ ] Todos os links externos têm `rel="noopener noreferrer"`
- [ ] Headers de segurança configurados no `.htaccess`
- [ ] CSP (Content Security Policy) ativo

## Passos para a implantação segura

### 1. Instalar as Dependências

```bash
npm install
```

### 2. Compilar o CSS Otimizado

Este comando compila o Tailwind CSS e gera um arquivo CSS minificado:

```bash
npm run build:css
```

### 3. Converter imagens para WebP (opcional)

Para melhorar a performance, você pode converter as imagens para o formato WebP:

```bash
npm run optimize-images
```

> **Nota:** Esta etapa requer a instalação do `cwebp` (parte do pacote libwebp). 
> O script fornecerá instruções de instalação se não estiver disponível.

### 4. Verificar Configurações de Segurança

**OBRIGATÓRIO** - Verificar antes do deploy:

- ✅ CNAME contém `moreirart.ie`
- ✅ Base href usa `https://moreirart.ie/`  
- ✅ Headers de segurança no `.htaccess`
- ✅ Google Analytics ID atualizado
- ✅ Manifest com URLs HTTPS

### 5. Fazer Upload dos Arquivos

Faça upload de todos os arquivos para seu servidor web, garantindo que os seguintes arquivos e diretórios estejam incluídos:

- `index.html`
- `dist/` (contendo o CSS compilado)
- `assets/` (contendo todas as imagens)
- `.htaccess` (configurações de segurança)
- `CNAME` (configuração do domínio)

## 🛡️ Otimizações de Segurança Implementadas

1. **HTTPS Enforcement**: Redirecionamento automático HTTP → HTTPS
2. **Security Headers**: X-Frame-Options, CSP, HSTS, XSS Protection
3. **Content Security Policy**: Restrição de fontes de script e estilo
4. **External Link Protection**: rel="noopener noreferrer" em todos os links externos
5. **Resource Integrity**: Crossorigin para CDNs externos
2. **Imagens WebP**: Suporte para imagens com melhor compressão quando disponíveis.
3. **Analytics**: Rastreamento básico de interações do usuário implementado.
4. **Performance**: Cache otimizado, compressão Gzip, preload de recursos críticos.

## 🔍 Verificações de Segurança Finais

Antes de finalizar o deploy, **OBRIGATÓRIO** verificar:

### Funcionalidade
- [ ] Funcionamento em diferentes navegadores (Chrome, Safari, Firefox, Edge)
- [ ] Responsividade em diferentes dispositivos (desktop, tablet, mobile)
- [ ] Validação de links e funções interativas

### Segurança HTTPS
- [ ] Site carrega com `https://moreirart.ie` sem avisos
- [ ] Redirecionamento automático de HTTP para HTTPS
- [ ] Cadeado verde/seguro no navegador
- [ ] Teste SSL Labs: https://www.ssllabs.com/ssltest/
- [ ] Verificação de headers: https://securityheaders.com/

### Performance
- [ ] PageSpeed Insights score > 90
- [ ] Core Web Vitals passando
- [ ] Imagens otimizadas carregando corretamente

## 🆘 Solução de Problemas HTTPS

### Problema: "Site não seguro" 
**Solução**: Verificar se CNAME está correto e aguardar propagação DNS (24-48h)

### Problema: "Conteúdo misto"
**Solução**: Verificar se todas as URLs no HTML usam HTTPS

### Problema: "Certificado inválido"
**Solução**: Reconfigurar domínio personalizado no GitHub Pages

---
**⚠️ IMPORTANTE**: Sempre teste em ambiente de produção antes de direcionar tráfego real!
