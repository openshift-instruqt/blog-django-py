#!/bin/bash

exec python manage.py runmodwsgi --log-to-terminal --port 8080 \
    --document-root htdocs --url-alias /media media
