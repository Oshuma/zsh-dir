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

# Uses ttyrec to record nethack sessions.
function rnethack() {
  recordings_dir="$HOME/.nethack/recordings"

  if [[ ! -w $recordings_dir ]]; then
    echo "Nethack recordings directory '$recordings_dir' not found or not writable."
    return
  fi

  recording_path="$recordings_dir/nethack-`date +%Y.%m.%d-%H%M%S`.ttyrec"
  ttyrec -e "nethack $*" $recording_path
  bzip2 $recording_path
}
