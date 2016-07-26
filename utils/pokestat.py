#!/usr/bin/env python3

import sys
import re
import requests 
from bs4 import BeautifulSoup

URL = 'http://www.mmoserverstatus.com/pokemon_go'

# Pick the code for the country you live in or that you're closest to.
country = 0

countries = {
    0: 'United States',
    1: 'Argentina',
    2: 'Australia',
    3: 'Austria',
    4: 'Belgium',
    5: 'Brazil',
    6: 'Bulgaria',
    7: 'Canada',
    8: 'Chile',
    9: 'Croatia',
    10: 'Czech Republic',
    11: 'Denmark',
    12: 'Estonia',
    13: 'Finland',
    14: 'Germany',
    15: 'Greece',
    16: 'Hong Kong',
    17: 'Hungary',
    18: 'Iceland',
    19: 'India',
    20: 'Indonesia',
    21: 'Ireland',
    22: 'Italy',
    23: 'Japan',
    24: 'Japan',
    25: 'Latvia',
    26: 'Lithuania',
    27: 'Luxembourg',
    28: 'Netherlands',
    29: 'New Zealand',
    30: 'Norway',
    31: 'Phillippines',
    32: 'Poland',
    33: 'Portugal',
    34: 'Romania',
    35: 'Russia',
    36: 'Singapore',
    37: 'Slovakia',
    38: 'Slovenia',
    39: 'Spain',
    40: 'Sweden',
    41: 'Switzerland',
    42: 'Taiwan',
    43: 'Thailand',
    44: 'Turkey',
    45: 'United Kingdom'
    }

# Getting information
r = requests.get(URL)
try:
    import lxml
    soup = BeautifulSoup(r.text, 'lxml')
except ImportError:
    soup = BeautifulSoup(r.text, 'html.parser')

c = countries[country]
found = soup.find(text=re.compile(' ?' + c))
parent = found.find_parent()
c_status = parent.i.attrs['class']

# Get game status
g = soup.find(text=' Poke Club Login')
g_parent = g.find_parent()
game_status = g_parent.i.attrs['class']

# Output
if 'red' in c_status and 'red' in game_status:
    print('  PKGO Down!')
elif 'red' in c_status and 'green' in game_status:
    print('  PKGO %s Server Down!' % c)
elif 'green' in c_status and 'red' in game_status:
    print('  PKGO Unstable!')
elif 'green' in c_status and 'green' in game_status:
    sys.exit(0)

