#!/bin/bash

exec python manage.py runmodwsgi --log-to-terminal --port 8080 \
    --url-alias /media media
