#!/usr/bin/env python3

"""
Custom mpc status message for use with i3blocks.

All it really does is put a play or pause icon based on song status.

That's it.

It's stupid, but hey, at least it looks nice.
"""

import subprocess

status = subprocess.check_output(['mpc', 'status']).decode('UTF-8')
current = subprocess.check_output(['mpc', 'current']).decode('UTF-8').strip('\n')

if '[playing]' in status:
    print(current, ' ')
elif '[paused]' in status:
    print(current, ' ')

