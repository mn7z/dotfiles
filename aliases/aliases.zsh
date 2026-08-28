## Google Cloud CLI aliases
alias gswitch="gcloud config configurations activate"
alias glogin="gcloud auth application-default login"

## Tool aliases
alias tf="terraform"
alias d=docker
7zp() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: 7zp <output_archive.7z> <file_or_folder_1> [file_or_folder_2 ...]"
    return 1
  fi

  local archive_name="$1"
  shift

  # Prompt for password without displaying typed characters
  read -s "?Enter password: " pass
  echo
  read -s "?Confirm password: " pass_confirm
  echo

  if [ "$pass" != "$pass_confirm" ]; then
    echo "Error: Passwords do not match."
    return 1
  fi

  7zz a -t7z -p"$pass" -mhe=on "$archive_name" "$@"
}
alias k=kubectl
alias vim=nvim
alias n=nvim
alias lzg='lazygit'
alias lzd='lazydocker'
alias wip='git commit -am "wip"'
