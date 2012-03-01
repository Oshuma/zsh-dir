# Automatically reconnects an ssh session on $interval.
# To halt this function, do this: touch $HOME/.ssh_stop_reconnect
function auto_ssh() {
  stop_file="$HOME/.ssh_stop_reconnect"
  interval=5

  if [[ -f $stop_file ]]; then
    echo "Cleaning restart file: $stop_file"
    rm -f $stop_file
  fi

  while true; do
    # Pass any args directly to ssh.
    ssh $*

    if [[ -f $stop_file ]]; then
      echo "Stopping auto-reconnect."
      return
    fi

    echo "Connection closed. Reconnecting in $interval seconds."
    sleep $interval
  done
}

# Clean up MongoDB if it wasn't shut down properly.
function cleanup_mongodb() {
  lock_file='/var/lib/mongodb/mongod.lock'
  echo "Removing $lock_file"
  sudo rm -f $lock_file

  echo "Running 'mongod --repair'"
  sudo mongod --repair

  echo "Done."
}

# Format titles for screen and rxvt.
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%\%}

  # truncate command and join lines
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\"       # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2 | $a:$3\a"  # plain xterm title
    ;;
  esac
}

# precmd is called before the prompt is printed
function precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "$USER@%m" "%35<...<%~"
}
