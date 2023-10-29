This script starts a simulation network in docker for you to test your scripts on attacker machine.

You don't need to change anything in target-image folder. 3 servers will be started for with ssh and ftp services. ssh user:pass is root:root in two of them. You can change it in target image Docker file btw. However it's not recomended.

You must implement web server and it's docker file your self. current Docker file is empty.

And finally you can put your necessary script for scan and attack in attacker-image folder near the Dockerfile file. These scripts will be located in /root folder in attacker container.

ATTENTION: All images are based on alpine linux which is a very light wight distro. It has an old bash version and you may have some challenges with the scripts you get from ChatGPT. Just give the new style script to ChatGPT and tell it to make the script compatible with old bash versions.
