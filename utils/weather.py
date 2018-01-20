#!/usr/bin/env python

import pyowm

# setup, exit on failure
try:
    owm = pyowm.OWM('497ea9c126364ec15f0ec30762a4365d')
    observation = owm.weather_at_place("Ashburn, US")
    w = observation.get_weather()
except:
    exit(0)

t = w.get_temperature('fahrenheit')
temperature = "{}°F".format(int(t['temp']))
#status = w.get_status()

# Print status and temp
#print(status, int(temperature))

# Print just temp
print(temperature)
