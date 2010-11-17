# Automatically reconnects an ssh session on $interval.
# To halt this function, do this: touch /tmp/ssh_stop_reconnect
function auto_ssh() {
  stop_file="/tmp/ssh_stop_reconnect"
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
