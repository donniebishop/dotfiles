#!/usr/bin/env python3

import sys

batpath = '/sys/class/power_supply/BAT0/'

with open(batpath + 'capacity') as blvl:
    level = int(blvl.read())

#with open(batpath + 'status') as bs:
#    status = bs.read().strip('\n')

if 100 > level >= 75:
    icon = ''
elif 75 > level >= 50:
    icon = ''
elif 50 > level >= 25:
    icon = ''
elif 25 > level >= 10:
    icon = ''
elif 10 > level:
    icon = ''

#if status == 'Discharging' or level == 100: 
#    print("{}  {}%".format(icon, level))
#elif status == 'Charging':
#    bolt = ''
#    print("{} {}  {}%".format(icon, bolt, level))

if level == 100:
    sys.exit(0)
else:
    print("{}  {}%".format(icon, level))
