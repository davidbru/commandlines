#!/bin/sh

# Clear DNS Cache
alias clearCache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"