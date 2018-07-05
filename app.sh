#!/bin/bash

set -x

PORT=${PORT:-8080}
SSL_PORT=${SSL_PORT:-8443}

ARGS=""

ARGS="$ARGS --log-to-terminal"
ARGS="$ARGS --port $PORT"
ARGS="$ARGS --document-root htdocs"
ARGS="$ARGS --url-alias /media media"

if [ -f /opt/app-root/cert/tls.key ]; then
    ARGS="$ARGS --ssl-port $SSL_PORT"
    ARGS="$ARGS --ssl-certificate /opt/app-root/cert/tls"

    NAMESPACE=`cat /var/run/secrets/kubernetes.io/serviceaccount/namespace`
    SERVICE=`echo $HOSTNAME | sed -e 's/^\(.*\)-[0-9]*-[a-z0-9]*$/\1/'`

    MOD_WSGI_SERVER_NAME=${MOD_WSGI_SERVER_NAME:-$SERVICE.$NAMESPACE.svc}

    ARGS="$ARGS --server-name $MOD_WSGI_SERVER_NAME"
    ARGS="$ARGS --server-alias '*'"
fi

if [ x"$MOD_WSGI_PROCESSES" != x"" ]; then
    ARGS="$ARGS --processes $MOD_WSGI_PROCESSES"
fi

if [ x"$MOD_WSGI_THREADS" != x"" ]; then
    ARGS="$ARGS --threads $MOD_WSGI_THREADS"
fi

if [ x"$MOD_WSGI_MAX_CLIENTS" != x"" ]; then
    ARGS="$ARGS --max-clients $MOD_WSGI_MAX_CLIENTS"
fi

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

if [ x"$BLOG_ENABLE_CRON_JOBS" != x"" ]; then
    ARGS="$ARGS --service-script cronjobs cronjobs.py"
fi

exec python manage.py runmodwsgi $ARGS
