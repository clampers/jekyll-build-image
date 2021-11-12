# (C) 2019 Adam C. Abernathy, LLC

FROM alpine:latest

ARG COMMIT_HASH

LABEL \
    maintainer="hello@adamabernathy.com" \
    commit=${COMMIT_HASH}

WORKDIR /app

# https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
# https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll
RUN \
    apk upgrade --update \
    && apk add \
        libatomic \
        readline \
        readline-dev \
        libxml2 \
        libxml2-dev \
        ncurses-terminfo-base \
        ncurses-terminfo \
        libxslt \
        libxslt-dev \
        zlib-dev \
        zlib \
        ruby-full \
        ruby-dev \
        yaml \
        yaml-dev \
        libffi-dev \
        build-base \
        git \
        ruby-io-console \
        ruby-irb \
        ruby-json \
        ruby-rake  \
        nodejs \
        npm \
    && gem install --no-document \
        redcarpet \
        kramdown \
        maruku \
        rdiscount \
        RedCloth \
        liquid \
        pygments.rb \
        sassc \
        safe_yaml \
    && gem install --no-document jekyll \
    && gem install --no-document \
        jekyll-paginate \
        jekyll-sass-converter \
        jekyll-sitemap \
        jekyll-feed \
        jekyll-redirect-from \
        uglifier \
        tzinfo \
        jemoji \
        github-pages \
    && gem install --no-document eventmachine --platform ruby \
    && rm -rf /root/src /tmp/* /usr/share/man /var/cache/apk/* \
    && apk del \
        build-base \
        zlib-dev \
        ruby-dev \
        readline-dev \
        yaml-dev \
        libffi-dev \
        libxml2-dev \
    && apk search --update ;

EXPOSE 80
