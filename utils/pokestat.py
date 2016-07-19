#!/usr/bin/env python3

import requests, re
from bs4 import BeautifulSoup

URL = 'http://www.mmoserverstatus.com/pokemon_go'

# Pick the code for the country you live in or that you're closest to.
country = 0

countries = {
    0: 'United States',
    1: 'Brazil',
    2: 'Germany',
    3: 'Italy',
    4: 'New Zealand',
    5: 'United Kingdom',
    6: 'Argentina',
    7: 'Australia',
    8: 'Austria',
    9: 'Belgium',
    10: 'Bulgaria',
    11: 'Canada',
    12: 'Chile',
    13: 'Croatia',
    14: 'Czech Republic',
    15: 'Denmark',
    16: 'Estonia',
    17: 'Finland',
    18: 'Greece',
    19: 'Hungary',
    20: 'Iceland',
    21: 'Ireland',
    22: 'Japan',
    23: 'Latvia',
    24: 'Lithuania',
    25: 'Netherlands',
    26: 'Norway',
    27: 'Poland',
    28: 'Portugal',
    29: 'Romania',
    30: 'Slovakia',
    31: 'Slovenia',
    32: 'Spain',
    33: 'Sweden',
    34: 'Switzerland',
    35: 'Taiwan',
    36: 'Thailand',
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
g = soup.find(text=' Game stable')
g_parent = g.find_parent()
game_status = g_parent.i.attrs['class']

# Output
if 'red' in c_status or 'red' in game_status:
    print('  PKGO Down!')
elif 'green' in c_status and 'green' in game_status:
    exit(0)

