# Instruções de Implantação (Deployment)

Este documento contém instruções para otimizar e implantar o site do Moreirart.

## Pré-Requisitos

- Node.js (v14 ou superior)

## Passos para a implantação

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

### 4. Atualizar o ID do Google Analytics

Antes de publicar, certifique-se de substituir o placeholder `G-XXXXXXXXXX` no arquivo `index.html` pelo seu ID real do Google Analytics.

### 5. Fazer Upload dos Arquivos

Faça upload de todos os arquivos para seu servidor web, garantindo que os seguintes arquivos e diretórios estejam incluídos:

- `index.html`
- `dist/` (contendo o CSS compilado)
- `assets/` (contendo todas as imagens)

## Otimizações Implementadas

1. **CSS Otimizado**: O Tailwind CSS é compilado e minificado, removendo classes não utilizadas.
2. **Imagens WebP**: Suporte para imagens com melhor compressão quando disponíveis.
3. **Analytics**: Rastreamento básico de interações do usuário implementado.

## Verificações Finais

Antes de finalizar o deploy, certifique-se de verificar:

- Funcionamento em diferentes navegadores (Chrome, Safari, Firefox, Edge)
- Responsividade em diferentes dispositivos (desktop, tablet, mobile)
- Validação de links e funções interativas
