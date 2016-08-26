#!/usr/bin/env python3

import sys
import re
import requests 
from bs4 import BeautifulSoup

URL = 'http://www.mmoserverstatus.com/pokemon_go'

# Pick the code for the country you live in or that you're closest to.
country = 1

countries = {
    1: 'United States',
    2: 'Brazil',
    3: 'Germany',
    4: 'Italy',
    5: 'United Kingdom',
    6: 'Turkey',
    7: 'Argentina',
    8: 'Australia',
    9: 'Austria',
    10: 'Belgium',
    11: 'Bulgaria',
    12: 'Cambodia',
    13: 'Canada',
    14: 'Chile',
    15: 'Croatia',
    16: 'Czech Republic',
    17: 'Denmark',
    18: 'Estonia',
    19: 'Finland',
    20: 'France',
    21: 'Greece',
    22: 'Hong Kong',
    23: 'Hungary',
    24: 'Iceland',
    25: 'Indonesia',
    26: 'Ireland',
    27: 'Japan',
    28: 'Laos',
    29: 'Latvia',
    30: 'Lithuania',
    31: 'Luxembourg',
    32: 'Malaysia',
    33: 'Mexico',
    34: 'Monaco',
    35: 'Netherlands',
    36: 'New Zealand',
    37: 'Norway',
    38: 'Papua N Guinea',
    39: 'Philippines',
    40: 'Poland',
    41: 'Portugal',
    42: 'Romania',
    43: 'Singapore',
    44: 'Slovakia',
    45: 'Slovenia',
    46: 'Spain',
    47: 'Sweden',
    48: 'Switzerland',
    49: 'Taiwan',
    50: 'Thailand',
    51: 'Venezuela',
    52: 'Vietnam',
    53: 'China',
    54: 'India',
    55: 'Israel',
    56: 'Pakistan',
    57: 'Peru',
    58: 'Russia Россия',
    59: 'South Korea',
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

