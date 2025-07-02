# Moreirart Portfolio - Security & HTTPS Configuration

## 🔒 Security Features Implemented

### 1. HTTPS Enforcement
- **Base URL** configured for HTTPS in HTML (`<base href="https://moreirart.ie/">`)
- **CNAME** properly set to `moreirart.ie`
- **Force HTTPS** redirect in `.htaccess`
- **HSTS** (HTTP Strict Transport Security) headers
- **CSP** (Content Security Policy) upgrade-insecure-requests

### 2. Security Headers
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `X-XSS-Protection: 1; mode=block`
- `Referrer-Policy: strict-origin-when-cross-origin`
- `Permissions-Policy` for geolocation, microphone, camera
- `Strict-Transport-Security` with preload

### 3. Content Security Policy (CSP)
- Restricted script sources to trusted domains
- Font sources limited to Google Fonts
- Image sources allow HTTPS and data URIs
- Frame ancestors blocked

### 4. External Resource Security
- All external links use `rel="noopener noreferrer"`
- External scripts loaded with `crossorigin="anonymous"`
- Resource integrity planned for major CDN resources

### 5. Performance & Caching
- Optimized cache headers for static assets
- Gzip compression enabled
- Image preloading for critical resources

## 🚀 Deploy Checklist for HTTPS

### Pre-Deploy
- [ ] Compile CSS: `npm run build:css`
- [ ] Optimize images: `npm run optimize-images` (optional)
- [ ] Verify CNAME file contains `moreirart.ie`
- [ ] Check all URLs use HTTPS in meta tags

### GitHub Pages Configuration
1. **Repository Settings → Pages**
2. **Custom Domain**: `moreirart.ie`
3. **Enforce HTTPS**: ✅ Enable
4. **Source**: Deploy from branch `main`

### DNS Configuration (Domain Provider)
```
Type: CNAME
Name: www (or @)
Value: [username].github.io
```

### Post-Deploy Verification
- [ ] Visit `https://moreirart.ie` (should work without warnings)
- [ ] Check redirect from `http://` to `https://`
- [ ] Verify SSL certificate is valid
- [ ] Test on SSL Labs: https://www.ssllabs.com/ssltest/
- [ ] Check security headers: https://securityheaders.com/

## 🛡️ Security Best Practices Applied

1. **No Inline Scripts** (except necessary Google Analytics)
2. **Trusted CDN Sources** with integrity checks
3. **Minimal External Dependencies**
4. **Secure Contact Forms** (WhatsApp link instead of form)
5. **No User Input Processing** (static site)
6. **Regular Dependency Updates**

## 📱 Progressive Web App Features

- **Web App Manifest** configured with HTTPS URLs
- **Standalone Display** mode
- **Proper Icons** for mobile installation
- **Theme Colors** matching brand

## 🔧 Maintenance

### Regular Updates
- Monitor Google Analytics for security events
- Check CDN integrity hashes periodically
- Update dependencies: `npm update`
- Review security headers quarterly

### Monitoring
- Use Google Search Console for HTTPS issues
- Monitor site speed with PageSpeed Insights
- Check security headers with security scanners

## 🆘 Troubleshooting HTTPS Issues

### Common Problems & Solutions

1. **Mixed Content Warnings**
   - Check all resources use HTTPS URLs
   - Verify base href is set correctly

2. **SSL Certificate Issues**
   - Wait 24-48 hours after domain configuration
   - Check DNS propagation

3. **Redirect Loops**
   - Verify `.htaccess` rules
   - Check GitHub Pages custom domain settings

4. **Performance Issues**
   - Verify gzip compression is working
   - Check image optimization
   - Monitor Core Web Vitals

---

**Last Updated**: January 2025  
**Security Level**: Production Ready ✅
