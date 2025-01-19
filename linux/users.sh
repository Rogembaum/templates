id
whoami
ls -ln
who

root cannot kill -9 init

rm -rf / - will not work
rm -rf /* - ops

#SUDO

sudo cd
# sudo: cd: command not found
# because CD - element of shell and CD is not binary file


chage -l ray
# Last password change                                    : Dec 03, 2024
# Password expires                                        : never
# Password inactive                                       : never
# Account expires                                         : never
# Minimum number of days between password change          : 0
# Maximum number of days between password change          : 99999
# Number of days of warning before password expires       : 7


su - need input password TARGET user (root by default)
# switch user

sudo su - ask my password and then, if my user's permissions allow to swith to root

/etc/sudoers - file with permissions for command sudo
root ALL=(ALL:ALL) ALL
user computername=(targetuser:targetgroup) command

sudo -s - run with my shell
sudo -i - run with target user shell