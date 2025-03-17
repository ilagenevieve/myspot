# Ocean-themed Website - Deployment Guide

This guide provides information for web servers to host the ocean-themed website optimally.

## Deployment Structure

The files in this branch are optimized for production:

- **index.html**: Minified HTML with all unnecessary whitespace and comments removed
- **css/style.css**: Minified CSS with optimized styles
- **js/**: Minified JavaScript files
  - animations.js: Handles visual effects and animations
  - theme.js: Manages dark/light mode functionality
  - script.js: Main JavaScript file for initialization
- **assets/**: Contains optimized images and other assets

## Server Configuration Recommendations

### Web Server Settings

- **Content Compression**: Enable gzip or Brotli compression for HTML, CSS, and JavaScript files
- **Cache Control**: Set appropriate cache headers
  - HTML: Cache-Control: no-cache
  - CSS/JS: Cache-Control: public, max-age=31536000, immutable
  - Images: Cache-Control: public, max-age=31536000, immutable
- **MIME Types**: Ensure proper MIME types are set
  - HTML: text/html
  - CSS: text/css
  - JS: application/javascript
  - SVG: image/svg+xml

### Performance Optimizations

- **HTTP/2**: Enable HTTP/2 for parallel loading of resources
- **TLS/SSL**: Use TLS 1.3 for secure and fast connections
- **CDN**: Consider using a CDN for global distribution

### Example Nginx Configuration

```nginx
server {
    listen 80;
    listen [::]:80;
    server_name example.com www.example.com;
    return 301 https://;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name example.com www.example.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;

    root /var/www/ocean-website;
    index index.html;

    location / {
        try_files  / =404;
    }

    location ~* \.(css|js)$ {
        expires 1y;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    location ~* \.(jpg|jpeg|png|gif|ico|svg|webp)$ {
        expires 1y;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    gzip on;
    gzip_vary on;
    gzip_min_length 1000;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
}
```

## Deployment Steps

1. Clone this repository or download the files
2. Upload the files to your web server's document root
3. Configure your web server according to the recommendations above
4. Test the website to ensure everything is working correctly

For any issues or questions, please refer to the main repository at [https://github.com/ilagenevieve/myspot](https://github.com/ilagenevieve/myspot).
