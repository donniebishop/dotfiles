#!/usr/bin/env python

from dotenv import dotenv_values
import pyowm

# load API key & location from .env
config = dotenv_values(".env")

# setup, exit on failure
try:
    owm = pyowm.OWM(config['api_key'])
    observation = owm.weather_at_place(config['location'])
    w = observation.get_weather()
except:
    exit(0)

t = w.get_temperature('fahrenheit')
#t = w.get_temperature('celsius')
temperature = "{}°".format(int(t['temp']))
#status = w.get_status()

# Print status and temp
#print(status, int(temperature))

# Print just temp
print(temperature)
