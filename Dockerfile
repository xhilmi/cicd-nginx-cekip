# Define image alpine
FROM alpine:latest

# Add nginx package
RUN apk add --no-cache nginx

# Add folder
RUN mkdir -p /run/nginx

# Create environment
ENV nginx_conf=/etc/nginx/nginx.conf
ENV nginx_web=/usr/local/share/web/

# Copy something
COPY nginx/nginx.conf ${nginx_conf}
COPY nginx/index.* ${nginx_web}

# Expose port
EXPOSE 80

# Run nginx daemon
CMD ["nginx", "-g", "daemon off;"]
