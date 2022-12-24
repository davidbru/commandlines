#!/bin/sh

# Start Postgres
# $ startPostgres
alias startPostgres="/opt/homebrew/opt/postgresql@11/bin/postgres -D /opt/homebrew/var/postgresql@11"





#POSTGRES
#If you need to have postgresql@11 first in your PATH, run:
#  echo 'export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"' >> ~/.zshrc
#
#For compilers to find postgresql@11 you may need to set:
#  export LDFLAGS="-L/opt/homebrew/opt/postgresql@11/lib"
#  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@11/include"
#
#
#To restart postgresql@11 after an upgrade:
#  brew services restart postgresql@11
#Or, if you don't want/need a background service you can just run:
#  /opt/homebrew/opt/postgresql@11/bin/postgres -D /opt/homebrew/var/postgresql@11

