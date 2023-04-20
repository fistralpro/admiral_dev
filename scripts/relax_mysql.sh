#/bin/bash 
# A script to relax the security of MySQL for easier development
# ./relax_mysql.sh

docker exec -it dev_mysql bin/sh -c "mysql -uroot -ppassword -e \"use mysql; update user set host='%'; flush privileges;\""
