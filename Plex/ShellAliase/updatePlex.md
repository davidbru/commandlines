# Alias to update plex

```
$ sudo nano ~/.bashrc
```

Add the following line:
```
# update/upgrade plex
alias updatePlex='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean && pip freeze --user | cut -d"=" -f1 | xargs -n1 pip install -U'
```
