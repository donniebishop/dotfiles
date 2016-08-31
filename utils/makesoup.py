#!/usr/bin/env python3

import bs4
import requests

def makesoup(url):
    r = requests.get(url)
    
    try:
        import lxml
        soup = bs4.BeautifulSoup(r.text, 'lxml')
    except ImportError:
        soup = bs4.BeautifulSoup(r.text, 'html.parser')

    return soup
