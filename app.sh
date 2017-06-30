#!/bin/bash

ARGS=""

ARGS="$ARGS --log-to-terminal"
ARGS="$ARGS --port 8080"
ARGS="$ARGS --document-root htdocs"
ARGS="$ARGS --url-alias /media media"

if [ x"$MOD_WSGI_RELOAD_ON_CHANGES" != x"" ];
then
    ARGS="$ARGS --reload-on-changes"
fi

exec python manage.py runmodwsgi $ARGS
