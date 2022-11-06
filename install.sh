

systemd_user_folder="$HOME/.config/systemd/user"

echo "mkdir for $systemd_user_folder"
install -v -d -D  $systemd_user_folder

echo "moving service and timer"

#  install [OPTION]... [-T] SOURCE DEST
install magicmirror.service $systemd_user_folder
install magicmirror.timer $systemd_user_folder

systemctl --user daemon-reload
systemctl --user enable magicmirror.timer
systemctl --user restart  magicmirror.service
