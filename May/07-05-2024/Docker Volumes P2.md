Docker Volumes: Part -2

I have done small demo or i practiced the commands related to the Docker Volume.

- I have created one volume by using the below command.

		docker volume create my_volume

- Now i have run a container with the volume which i have created by using the below command.

		docker run -d --name my_container -v my_volume:/data my_image

- After that i have checked that volume has been mounted properly to the container or not by using the below command.

		docker inspect my_container

- Now i have written or stored some data in the volume which i have creted by using the below commands.

		docker exec -it my_container sh
		echo "Hello, Docker Volume!" > /data/test.txt
		exit

- Now i have removed the contaier which my volume is mounted to. this was done by using the below command.

		docker rm -f my_container

- Now i have run a new container with the same volume which i have created previously. by using the below command.

		docker run -d --name new_container -v my_volume:/data my_image

- Now we can see that the data which we stored in the previous steps will be there like that only without any data loss still if we deleted the previously mounted container. this can done by using below commands.

		docker exec -it new_container sh
		cat /data/test.txt

This demo will explain us how data written to the volume persists even after the original container is removed and a new one is created with the same volume.

The main moto of the docker volume concept is docker volumes are powerful for managing data in dockerized environments, providing a flexible and efficient way to handle persistent storage needs.


