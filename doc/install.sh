//clone the project
git clone https://github.com/bbachi/docker-multibuild-example.git// change to WebApp directory
cd WebApp// build the Angular Project
npm run build// change back to root directory and start the nodejs server
cd ..
npm start


crtl-c to stop docker
docker-compose down

cd nest
docker build -t full-server-nest .

docker logout
docker login
#marcelophd @Ma29

docker images #take id of image do you want

#REPOSITORY          TAG                  IMAGE ID            CREATED             SIZE
#full-server-nest    latest               1fa0e16c5a9c        6 minutes ago       234MB

docker tag 1fa0e16c5a9c marcelophd/full-server-nest:mytag
docker push marcelophd/full-server-nest:mytag

# to remove 
#docker rmi marcelophd/full-server-nest:mytag
# in server
#docker run -d -p 4444 --name full-server-nest marcelophd/full-server-nest:mytag
docker pull marcelophd/full-server-nest:mytag
#docker run -d -p 4444 --name full-server-nest marcelophd/full-server-nest:mytag

docker run -d \       
--name full-server-nest \   
-v /var/run/docker.sock:/var/run/docker.sock \
marcelophd/full-server-nest:mytag --debug --interval 120 #seconds 2 minuts


##################
cd ..
cd express
# BUILD
docker build -t full-server-express .

docker logout
docker login
#marcelophd @Ma29

docker images #take id of image do you want

#REPOSITORY          TAG                  IMAGE ID            CREATED             SIZE
#full-server-express    latest               7415658b2107        6 minutes ago       234MB

docker tag 7415658b2107 marcelophd/full-server-express:mytag

# PUSH
docker push marcelophd/full-server-express:mytag

# to remove 
#docker rmi marcelophd/full-server-express:mytag
# in server
#docker run -d -p 5555 --name full-server-express marcelophd/full-server-express:mytag
docker pull marcelophd/full-server-express:mytag
#docker run -d -p 5555 --name full-server-express marcelophd/full-server-express:mytag
docker run -d \         
--name full-server-express \
-v /var/run/docker.sock:/var/run/docker.sock \
marcelophd/full-server-express:mytag --debug --interval 120

# TO UPDATE
# BUILD
# PUSH

docker logs full-server-express
docker logs full-server-nest


#docker-compose up

#######################  TESTS
id -nG # verify all group
docker ps
docker ps -a #list all containers
docker ps -l
docker start id-container
docker stop id-container
docker rm id-container
#remove alll
docker rm $(docker ps -a)

#listar 
docker images -f dangling=true
#remover all volumes
docker volume prune
#listart images
docker images -a
#remover images
docker rmi id-image
#remove all images
docker rmi $(docker images -a)
#remove tag repository
docker rmi repository/image-name:tag
# scan docker-compose
which docker-compose
#rm all docker-compose
sudo rm $(which docker-compose)
sudo docker rmi -f image-id

#register docker-hub
docker login -u projetoslinux
@Ma29
#baixando imagem com outro user
docker tag sammy/ubuntu-nodejs projetoslinux/ubuntu-nodejs
 
#push
docker push projetoslinux/docker-image-name
    

docker-compose down  # Stop container on current dir if there is a docker-compose.yml
docker rm -fv $(docker ps -aq)  # Remove all containers
sudo lsof -i -P -n | grep <port number>  # List who's using the po
