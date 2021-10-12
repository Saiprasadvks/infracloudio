First I brought up the prometheus container and checked the prometheus.yaml file. Then copied that to my local and modified that file to read the application host.

Then created the docker compose file and ran the below command in compose yaml file location

#sudo docker-compose up  
 or
#sudo docker-compose up -d  (To run in background)


Note: In my case firewalld was enabled so I ran below command to open the port

#sudo systemctl status firewalld
#sudo firewall-cmd --list-all
#sudo firewall-cmd --add-port=9393/tcp --permanent
#sudo firewall-cmd --reload
#sudo firewall-cmd --list-all
