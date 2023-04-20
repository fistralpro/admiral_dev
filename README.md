# admiral_dev

A repo containing all that is needed to start developing admiral projects

## Getting Started

These instructions will get you a the dev environment up and running on your local machine for development and testing purposes.
Your dev environments is not designed to be destroyed and recreated quickly, unlike the projects within it.  

### Prerequisites

Tested on  
WSL 2  
`C:\> wsl -l -v)`    
Ubuntu 22.04 LTS  
`$ cat /etc/issue`   

Developed in VSCode, but the choice is yours  

### Installing

In wsl...  
_apt update and upgrade if you want_
Install git `sudo apt-get -y install git`  
Install docker (follow instructions at end) `./scripts/install_docker.sh`    


### Using
launch   `docker compose up --detach`  
list   `docker ps -a`  
stop   `docker compose stop`  
start   `docker compose start`  
down  `docker compose down`  
destroy db volume   `docker volume rm admiral_dev_dev-datavolume`    
look at the network   `docker network inspect backend_network`  


__note the mysql docker instance is for development, you can access the server from windows by running the script ./scripts/relax_mysql.sh__  

### Suggested Workspace structure

workspace/  
├─ admiral_dev/  
│  ├─ scripts/  
│  │  ├ install_docker.sh  
│  │  └ ...  
│  ├─ .gitignore  
│  ├─ dev_mysql.cnf  
│  ├─ docker-compose.yml  
│  ├─ README.md  
│  └─ ...  
├─ another_git_repo/  
│  ├─ .gitignore  
│  ├─ new_folder/  
│  ├─ docker-compose.yml  
│  ├─ README.md  
│  └─ ...  
└─ another_git_repo/  
   └─ ...  
