from __future__ import print_function

import schedule
import time
import os

def hourly():
    os.system('powershift image jobs hourly')

schedule.every().hour.do(hourly)

while True:
    schedule.run_pending()
    time.sleep(1)
