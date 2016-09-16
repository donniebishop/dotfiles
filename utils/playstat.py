#!/usr/bin/env python3

"""
Custom mpc status message for use with i3blocks.

All it really does is put a play or pause icon based on song status.

That's it.

It's stupid, but hey, at least it looks nice.

Oh yeah, I have no idea why the print statement in line 24 works. But it does
, and keeps the status line from flickering in and out. I really don't know why
it works, but I'm not gonna fight it either.

Remove at your own risk.
"""

import os
import subprocess

if os.environ['BLOCK_BUTTON'] == '1':
    subprocess.run(['mpc', 'prev'])
    print(current)
elif os.environ['BLOCK_BUTTON'] == '2':
    subprocess.run(['mpc', 'toggle'])
    print(current)
elif os.environ['BLOCK_BUTTON'] == '3':
    subprocess.run(['mpc', 'next'])
    print(current)

status = subprocess.check_output(['mpc', 'status']).decode('UTF-8')
current = subprocess.check_output(['mpc', 'current']).decode('UTF-8').strip('\n')
current = current.replace(';', ', ')

if '[playing]' in status:
    print(current, '')
elif '[paused]' in status:
    print(current, '')

