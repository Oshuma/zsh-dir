#
# Useful Nethack shit.
#

# Use custom compiled nethack.
local_nethack="$HOME/local/games/nethack"
alias cnethack=$local_nethack

# Uses ttyrec to record nethack sessions.
function rnethack() {
  recordings_dir="$HOME/.nethack/recordings"
  recording_path="$recordings_dir/`date +%Y`/`date +%m`"
  recording_name="`date +%d-%H%M%S`.ttyrec"
  recording_file="$recording_path/$recording_name"

  if [[ ! -w $recordings_dir ]]; then
    echo "Nethack recordings directory '$recordings_dir' not found or not writable."
    return
  fi

  if [[ ! -w $recording_path ]]; then
    echo "Creating: $recording_path"
    mkdir -p $recording_path
  fi

  echo "Recording Nethack session to: $recording_file"
  ttyrec -e "nethack $*" $recording_file
  bzip2 $recording_file
}
