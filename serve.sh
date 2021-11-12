
#!/bin/sh

# (C) 2019 Adam C. Abernathy, LLC

rm -fr _site
rm -fr dist
rm -fr .sass-cache
rm -fr .jekyll-cache

jekyll --version
JEKYLL_ENV=development jekyll serve \
    --host 0.0.0.0 \
    --port 80 \
    --source site \
    --strict_front_matter \
    --livereload \
    --incremental \
    --trace \
    --config jekyll.yaml ;
