

systemd_user_folder="$HOME/.config/systemd/user"

echo "mkdir for $systemd_user_folder"
install -v -d -D  $systemd_user_folder

bin="$HOME/bin"
echo "mkdir for $bin"
install -vdD  $bin

echo "moving script"
install start-chromium.sh  $bin


echo "moving service and timer"

#  install [OPTION]... [-T] SOURCE DEST
install magicmirror.service $systemd_user_folder
install magicmirror.timer $systemd_user_folder

systemctl --user daemon-reload
systemctl --user enable magicmirror.timer
systemctl --user restart  magicmirror.service
