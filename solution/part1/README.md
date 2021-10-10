Granted sudo permission to user then followed below command

#sudo yum install docker*
#sudo docker pull infracloudio/csvserver:latest
#sudo docker pull prom/prometheus:v2.22.0
#sudo docker images

Part1::

1.Run the container image infracloudio/csvserver:latest in background and check if it's running.

#sudo docker ps -a
#sudo docker run -it -d --name infracloudio1 docker.io/infracloudio/csvserver /bin/bash


#sudo docker ps
CONTAINER ID        IMAGE                              COMMAND             CREATED             STATUS              PORTS               NAMES
40cfcdf31d33        docker.io/infracloudio/csvserver   "/bin/bash"         2 minutes ago       Up 2 minutes        9300/tcp            infracloudio1


2.If it's failing then try to find the reason, once you find the reason, move to the next step.

          I didn't see any failure when launch/creating the container. But if container start without interactive terminal option it keep stopping. 

3.Write a bash script gencsv.sh to generate a file named inputFile whose content looks like:

          Created the script and worked as expected. Placed it in git repo.
#mkdir /csvserver
#./gencsv.sh
#cat /csvserver/inputfile
		  
4.Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).
		  
#sudo docker run -it -d --name infracloudio2 -v /csvserver/inputfile:/csvserver/inputdata docker.io/infracloudio/csvserver /bin/bash		  
#sudo docker ps
#sudo docker exec -it infracloudio2 /bin/bash
#ls -l
csvserver  inputdata

5.Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

#sudo docker exec -it infracloudio2 /bin/bash
#netstat -tupln
#nohup ./csvserver & 
#netstat -tupln

     -- found  csvserver is running with the port 9300
	 
#sudo docker stop infracloudio2
#sudo docker rm infracloudio2
