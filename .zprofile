
#
# ~/.zprofile
#

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

typeset -U path
path=(~/.local/bin /usr/local/sbin /usr/local/bin 
      /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl 
      /usr/bin/core_perl $path[@])

# vim: sw=4
