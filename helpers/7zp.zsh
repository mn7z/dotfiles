# 7-zip helper to create password protected archive with entrypted
# file headers.
7zp() {
  if [ "$#" -lt 2 ]; then
    echo "Usage: 7zp <out.7z> <file_or_folder_1> [file_or_folder_2 ...]"
    return 1
  fi

  local archive_name="$1"
  shift

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
