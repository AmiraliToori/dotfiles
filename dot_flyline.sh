#!/usr/bin/env bash
#
# Palette reference (Dracula Dark):
#   Background  #282a36
#   Current Ln  #44475a
#   Foreground  #f8f8f2
#   Comment     #6272a4
#   Cyan        #8be9fd
#   Green       #50fa7b
#   Orange      #ffb86c
#   Pink        #ff79c6
#   Purple      #bd93f9
#   Red         #ff5555
#   Yellow      #f1fa8c
#
# These flyline settings only style flyline's own UI elements (syntax
# highlighting, suggestions, tab-completion, tooltips). They do not touch
# ANSI colours 0-15, so they cannot override or conflict with the
# terminal emulator's own Dracula Dark colour scheme.

# Start from flyline's dark preset as a safe base, then override with Dracula.
flyline set-style --default-theme dark

flyline set-style \
  recognised-command="#50fa7b" \
  unrecognised-command="bold #ff5555" \
  bash-reserved="bold #ff79c6" \
  single-quoted-text="#f1fa8c" \
  double-quoted-text="#f1fa8c" \
  env-var="#bd93f9" \
  comment="italic #6272a4" \
  normal-text="#f8f8f2" \
  secondary-text="dim #6272a4" \
  inline-suggestion="dim italic #6272a4" \
  tutorial-hint="bold italic #8be9fd" \
  matching-char="bold #ffb86c" \
  opening-and-closing-pair="bold #ffb86c" \
  selected-text="reverse #bd93f9" \
  key-sequence-style="bold #8be9fd" \
  markdown-heading1="bold #ff79c6" \
  markdown-heading2="bold #bd93f9" \
  markdown-heading3="bold #8be9fd" \
  markdown-code="#50fa7b"

# options
flyline mouse --mode disabled
flyline set-cursor --backend terminal

flyline_fzf_cd() {
  local cmd
  cmd=$(__fzf_cd__) && READLINE_LINE="$cmd" READLINE_POINT=${#cmd}
}

flyline key bind Ctrl+r 'always=runBashCommand(__fzf_history__)' # or runBashCommand(__fzf_history__)+submitOrNewline
flyline key bind Ctrl+t 'always=runBashCommand(fzf-file-widget)'
flyline key bind Alt+c 'always=runBashCommand(flyline_fzf_cd)+submitOrNewline'
