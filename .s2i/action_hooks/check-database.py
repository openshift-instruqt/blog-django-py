from __future__ import print_function

import sys
import time

import django

django.setup()

from django.db import connection

remaining = 600.0
delay = 2.0

success = False

while remaining > 0.0:
    try:
        print('Check whether database is ready...')
        cursor = connection.cursor()
        with cursor:
            cursor.execute('SELECT 1')
            cursor.fetchall()

        success = True

        break

    except Exception:
        pass

    time.sleep(delay)

if not success:
    print('Failed to connect to database')

    sys.exit(1)
