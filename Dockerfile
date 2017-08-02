FROM  php:7.1-cli

MAINTAINER Robert Deutz

# Install
RUN apt-get update \

    && apt-get install -y curl zip unzip git software-properties-common \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin/ --filename=composer \
    && apt-get remove -y --purge software-properties-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && export COMPOSER_HOME=/usr/local \
    && composer global require squizlabs/php_codesniffer:~1.5 \
    && composer global require phpmd/phpmd \
    && composer global require sebastian/phpcpd \
    && composer global require phploc/phploc \
    && composer global require sebastian/phpdcd \
    && composer global require laravel/envoy \
    && echo 'export PATH=/usr/local/vendor/bin:$PATH' >> $HOME/.bashrc


COPY config/php.ini /usr/local/etc/php/
