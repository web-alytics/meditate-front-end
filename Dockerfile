FROM nginx:1.17-alpine
COPY static /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/configfile.template
ENV PORT 8080
ENV HOST 0.0.0.0
RUN sh -c "envsubst '\$PORT'  < /etc/nginx/conf.d/configfile.template > /etc/nginx/conf.d/default.conf"
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
