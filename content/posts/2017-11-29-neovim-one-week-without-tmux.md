---
title: "Neovim terminal: one week without tmux"
created_at: 2017-11-29 21:22:18 +0100
kind: article
published: falsed
tags: ['neovim', 'terminal', 'multiplexer', 'tmux']
---
Disclaimer:

- not an advanced vim user
- not an advanced tmux user


tnoremap jj <C-\><C-n>

http://www.michaelabrahamsen.com/posts/replace-tmux-with-neovim/

on enter terminal buffer keep in non insert mode, not a big deal to push i when I want to write to them

copy paste:

  - just the usual y p
  - when want to pass stuff to the os, use "+ register

resizing:

  - vertical-resize, resize work! 

zooming:

  - vim-zoom: kinda works, but buffer needs to be saved and you have to save your buffers
  - ZoomWin: 
    - big lag 
    - doesn't play well with pandoc and other plugins, many errors when zooming/restoring
    - bad with swap files

  - szw/vim-maximizer: 
    - just equivalent to doing a resize, so other windows don't disappear just minimized
    - fast and simple => my choice

nesting:

  - no protection against it:
    just have to forget the worflow of:
      1. navigating in a terminal
      2. launching vim
    instead:
      1. navigate in a terminal (or better in NERD)
      2. open file in a split
    will work, but some escape sequence won't

detaching:

  tmux is a terminal multiplexer, but it also supports detaching/attaching
  this is really a usefull feature I'm not ready to lose yet.
  For example, it allows me to upgrade my terminal emulator without loosing my session.
  Lets use abduco (a detach clone) for that:

    alias vmux="abduco -e '^q' -A nvim-session nvim"
