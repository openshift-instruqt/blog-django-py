#!/bin/bash

PORT=${PORT:-8080}

ARGS=""

ARGS="$ARGS --log-to-terminal"
ARGS="$ARGS --port $PORT"
ARGS="$ARGS --document-root htdocs"
ARGS="$ARGS --url-alias /media media"

if [ x"$MOD_WSGI_RELOAD_ON_CHANGES" != x"" ]; then
    ARGS="$ARGS --reload-on-changes"
fi

if [ x"$MOD_WSGI_DEBUG_MODE" != x"" ]; then
    ARGS="$ARGS --debug-mode"
fi

if [ x"$MOD_WSGI_ENABLE_DEBUGGER" != x"" ]; then
    ARGS="$ARGS --enable-debugger"
fi

if [ x"$MOD_WSGI_ENABLE_WEBDAV" != x"" ]; then
    ARGS="$ARGS --include configs/webdav.conf"
fi

exec python manage.py runmodwsgi $ARGS
