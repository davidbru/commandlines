https://gist.github.com/infn8/8523902#file-hide-desktop-command

### Commands that will hide or show your hidden files on a mac when double clicked. 

Commands need to be executable so remember to ```chmod +x *.command``` in the folder you store these in.

Recently updated to include the line:

```
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")'
```

so that the terminal windows don't hang around.
