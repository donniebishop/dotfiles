
#
# ~/.zprofile
#

# set path
typeset -U path
path=(~/.local/bin /usr/local/sbin /usr/local/bin 
      /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl 
      /usr/bin/core_perl $path[@])

# set vim as editor
export EDITOR=/usr/bin/vim

# start x
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

# vim: sw=4
