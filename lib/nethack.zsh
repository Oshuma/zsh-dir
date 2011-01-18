#
# Useful Nethack shit.
#

# Use custom compiled nethack.
local_nethack="$HOME/local/games/nethack"
alias cnethack=$local_nethack

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
