#/bin/bash 
# Ubuntu 20.04 amd64 install of docker
# run with
#    sudo ./install_docker.sh

[[ "$EUID" -ne 0 ]] && echo "This script must be run as root e.g: sudo ./install_docker.sh" && exit 1


# 1. Required dependencies 
apt-get update -y
apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release 

# 2. GPG key 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 

# 3. Use stable repository for Docker 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 

# 4. Install Docker 
apt-get update 
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# 5. Add user to docker group 
groupadd docker 
usermod -aG docker $USER 

# 6. WSL2 Kernel do not support nftables causing docker to fail startup 
# https://github.com/microsoft/WSL/issues/6655
update-alternatives --set iptables /usr/sbin/iptables-legacy
update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

# 7. Autostart
echo 'if [ -n "`service docker status | grep not`" ]; then' >> ~/.profile
echo '	    sudo /usr/sbin/service docker start' >> ~.profile
echo 'fi' >> ~.profile

# 8. Remove from sudoers (so not prompted for password
echo "You will need to do this manually"
echo "    sudo visudo -f /etc/sudoers.d/passwordless_docker_start"
echo "add the following to the file changing the username appropriately"
echo "username        ALL = (root) NOPASSWD: /usr/sbin/service docker start"