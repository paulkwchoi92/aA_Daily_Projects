
docker container run - d - p 8080: 80 --name web nginx

docker container run // command telling docker tyo start

  - d // adding this flag means to start container in detached mode4

  - p 8080: 80 //- this is letting docker know that you want expose a
//port on your local machine and that any traffic on that port 
//should route to the container IP.

// * The internal host IP is on the left: 8080
// * The ip for the container is on the right: 80
// * With this configuration you can go to http://localhost:8080 and
// see your container running!


--name web //- the name flag allows you to directly name a container

nginx // the final part of this command is the image we want to use for running this container.


// The container start up does the following:

// Docker looks for the image locally(in this case nginx) in your image cache
// If it's not found locally then Docker looks into the remote image repository (which defaults to Docker Hub)
// Docker then downloads the latest version of the image(nginx: latest by default )
// A new container is created based on that image and prepares to start
// Docker gives the container the virtual IP on a private network inside of the Docker Engine
// Docker opens up port 8080(the - p flag) on localhost and forwards any traffic to port 80 in the container
// Starts the container by using the CMD in the image's Dockerfile

docker container run--name - p 80: 80 nginx 

//docker cheat sheet

docker--help //- the most useful command! It will list out all the options available to you.
docker run[OPTIONS] IMAGE[: TAGNUMBER][COMMAND] //- Check out the Docker run documentation for a list of options and flags.
docker container ls //- lists all your running containers
docker container ls - a //- lists all your containers(running or stopped)
docker container stats //- with no provided container name to get live performance data
docker container inspect < CONTAINERNAME >// - Will return json with the metadata about that specific container
docker container top < CONTAINERNAME > //- Display the running processes of a container.
docker container rm < CONTAINERNAME > //- remove one or more stopped containers
docker container rm - f < CONTAINERNAME > //- stop and remove a running container
docker container run - it < IMAGENAME > bash //- For running interactive processes(like a shell in this instance).
docker container run exec //- Run a command in a running container


/// ------------- data that will exit out of the docker life cycle is called persistent data
// - two forms: 
  // * Volumne: The Host filesystem stores volumes but they are managed by Docker 
  //in C: \ProgramData\docker\volumes

docker run - v / path /in /container


// * Bind Mount:Bind Mounts - Can be stored anywhere on the container host and mounted on the running container. 
//Can exist anywhere in the host filesystem. 

docker run - d \
--name devtest \
--mount type = bind, source = "$(pwd)" / target, target = /app \
nginx: latest

/// ----- getting inside a container
  / bin / sh - c "while :; do wget -qO- http://quotesondesign.com/wp-json/posts; printf '\n'; sleep 5s; done"
/// ----- getting inside a container