# My emacs config

Originally based on [Sean Miller](https://github.com/smiller/.emacs.d)'s emacs config

With some additions from [Setting up Emacs as Ruby development environment on OSX](http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/?utm_source=rubyweekly&utm_medium=email)

And a few pieces stolen directly and indirectly from [Ryan Davis](https://github.com/zenspider)

And mostly rewritten by me at this point. ;-)

# Prerequisites
## Emacs (duh)
## If you've previously used emacs...
Make a backup of your .emacs.d and then get rid of it.
## Clone this repo
```
git clone https://github.com/elight/.emacs.d.git ~
```
## Install [Cask](https://github.com/cask/cask) (package management for Emacs)

Super duper quick and dirty Cask install (FWIW, I used it):

```
curl -fsSkL https://raw.github.com/cask/cask/master/go | python
```

## Install the packages
```
cd ~/.emacs.d
```

```
cask install
```

# Some basic tips

## Finding files ([Projectile](https://github.com/bbatsov/projectile))

*C-x p* brings up a file chooser

*C-u C-u C-x p* invalidates Projectile's cache and then brings up the file chooser. You'll want to do this after you delete or create a new file.

## [Multi-term](http://www.emacswiki.org/emacs/download/multi-term.el) (Thanks, Avdi!)

*C-x m* spawns a terminal in your current window

Scrolling behaves basically the same as scrolling in a normal emacs Window

## Window numbering (Thanks, Sean!)

*C-x 3* creates a vertical window split

*C-x 2* creates a horizontal window split

Windows are numbered! See the first character in the bottom left!

*M-window_number_here* jumps you to the numbered window

## Searching

*M-x ag* prompts for a search term and a search directory

Move the cursor to the desired result, hit return, and enjoy the navigational awesomeness
