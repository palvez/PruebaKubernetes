FROM centos:7
RUN yum install yum-utils -y; yum-config-manager --enable remi-php56; yum install php php-cli php-gd php-mysql git httpd -y
RUN systemctl enable httpd
ENV DB_HOST="" DB_USER="" DB_PASSWORD="" DB_DATABASE=""
WORKDIR /var/www/
RUN git clone https://github.com/palvez/simple-ecomme.git
RUN mv ./simple-ecomme/* ./html && mkdir /var/www/html/img/uploads && chmod -R a+rw /var/www/html/img/uploads && rm -R ./simple-ecomme/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]