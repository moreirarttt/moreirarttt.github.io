# Guia de Deploy Rápido para Moreirart.ie (GitHub Pages)

Este documento detalha os passos essenciais para deploy do site em produção via GitHub Pages.

## 1. Preparação dos Arquivos

### 1.1 Compilar o CSS Otimizado
```bash
npm run build:css
```
> Este comando gera o arquivo `dist/styles.min.css` otimizado.

### 1.2 Otimizar Imagens (opcional)
```bash
npm run optimize-images
```
> Converte imagens para WebP para melhor performance.

### 1.3 Atualizar Informações Críticas
1. Substituir o placeholder `G-XXXXXXXXXX` no arquivo `index.html` pelo seu ID real do Google Analytics
2. Atualizar o ano do copyright para o atual (2025)

## 2. Verificação do Repositório Local

Confirme que os seguintes arquivos/diretórios estão atualizados:
- `index.html` (com GA ID atualizado e ano correto)
- `dist/styles.min.css` (recém-compilado)
- `assets/` (imagens otimizadas, se aplicável)

## 3. Preparação e Envio para o GitHub

Abra o terminal na pasta raiz do projeto e execute:

```bash
# Adicionar todas as alterações
git add .

# Comitar as mudanças
git commit -m "Final adjustments and readiness for deploy"

# Enviar para o GitHub (branch principal)
git push origin main
```
> Substitua `main` por `master` se esse for o nome do seu branch principal.

## 4. Configuração no GitHub Pages

1. Acesse https://github.com/[seu-usuario]/moreirart.github.io
2. Vá para "Settings" (Configurações)
3. No menu lateral, selecione "Pages"
4. Na seção "Build and deployment" configure:
   - Source: "Deploy from a branch"
   - Branch: "main" (ou "master") e pasta: "/" (root) ou "/docs"
   - Clique em "Save"
5. Aguarde alguns minutos para a publicação ser concluída

## 5. Verificação Pós-Deploy

1. Acesse a URL do site publicado (ex: https://[seu-usuario].github.io/moreirart)
2. Realize os seguintes testes:
   - Navegação entre seções
   - Links internos e externos
   - Funcionamento do zoom da galeria
   - Carregamento correto das imagens
   - Visualização em diferentes tamanhos de tela
3. Abra o console do navegador (F12) e verifique se não há erros
4. Acesse seu painel do Google Analytics para confirmar que os dados estão sendo recebidos

## Solução de Problemas Comuns

- **Alterações não apareceram**: Pode levar alguns minutos para as alterações serem publicadas. Se após 10 minutos não aparecerem, verifique as configurações do GitHub Pages.
- **Imagens quebradas**: Verifique se os caminhos (paths) das imagens estão corretos para GitHub Pages.
- **CSS não aplicado**: Confirme que o caminho para o arquivo CSS está correto no HTML.

## Links Úteis

- Documentação GitHub Pages: https://docs.github.com/en/pages
- Repositório: https://github.com/himatth/moreirart.github.io.git
