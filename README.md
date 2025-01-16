# Use of QMEQ in a Docker container to enhance ease of installation 
This repo is about building a Docker image with QMEQ installed. It is aiming at setting up the environment easier and in a faster way that setting it up in your machine (no matter what you use, virtual environments or Anaconda, it is always a tricky process). Using Docker for this makes things easier to duplicate in different machines with different OSs.

## Prerequisistes
It is very important to say that you must clone [qmeq repository](https://github.com/gedaskir/qmeq) first, as you can see in the Dockerfile, the folder is copied into the container.

## Building the image
There is a small bash script to build the image if you're not familiar with Docker, you can run it in Linux or MacOS without any issue, to run it on Windows you will need to have installed WSL to have Docker working, so it should not be an issue.

### Automatically
You can run the script running the following command:
```bash
./build_image.sh
```

### Manually
Or if you want to build it manually using Docker, you can change *qmeq* for any name you want to give to the generated image:
```docker
docker build -t qmeq .
```

With the image created in your system, which you can check running ```docker images``` and you should get the following item in your terminal:
```shell
qmeq                                   latest            12b524e44ef3   16 seconds ago   1.01GB
```

## Deploy container
Now it's time to create the container based on our new Docker image. It is important to remember that container deployment must be slightly configured in order to get it working as wanted. As this container is intentended to be accessed from outside of the default bridge network Docker has, we must expose a port and map a directory to it so we don't lose our work and make things easy when we need to move those files.

### Automatically
There is a small script to deploy the container with the directory and port mapping set, which you can run as following:
```bash
./deploy.sh
```

### Manually
Or if you want to deploy it manually using Docker, you can change *qmeq* in the ```--name qmeq``` flag to name the container the you want to and run the following command:
```docker
docker run -it --name qmeq -v .:/app/ -p 8888:8888 qmeq
```

## Accessing Jupyter's web interface
After deployment, you must pay attention to the logs of the container after start. It will provide two urls to access it