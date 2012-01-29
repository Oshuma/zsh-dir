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
