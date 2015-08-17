#wallabag-docker
Dockerfile used to build a wallabag docker image.

##Credits
I forked this from neosar, who forked it from bobmaerten.

Wallabag is an opensource project created by @nicosomb

This docker image is build upon the baseimage made by phusion.

##Image Details
- This image will create a ready-to-go install of Wallabag that just needs to be configured by doing the last step of the web-based installer.  
- You can choose Postgres as an option for the database.  
- Postgres is **not** included with this image so you will need a linked or external SQL server.  

##Docker Base Image
This image is based on [phusion/baseimage-docker](https://registry.hub.docker.com/u/phusion/baseimage/)

##Installation
###Download
If you want to prefetch the image to store locally before deploying you should run the following:  

    docker pull marble/wallabag

###Running
**To Run a Named Instance Linked to a Postgres Container**

    docker run --name wallabag --link sqlcontainer:sqlcontainer -p 80:80 -d marble/wallabag

**To Pass a Custom Salt Value to the Config (Highly Recommended)**

    docker run --name wallabag -p 80:80 -e WALLABAG_SALT=somesaltvaluemuchmoresecurethanthis -d marble/wallabag

Check the [phusion/baseimage](https://github.com/phusion/baseimage-docker) documentation for all kind of additional options and switches.

###Usage
- After installed you should be able to access it in the browser at the specified port.  
- At this point you should select a Postgres database, and specify any necessary values.  
- Set your login name and password.  
- The installer will automatically remove the install folder after it completes, and bring you to the login page.

###Volumes
I have symlinked /wallabag to it's full path (/var/www/wallabag) and exposed it as a volume for easier access.

## Building from Dockerfile

1. Clone Git Repository

    git clone https://github.com/marble/dockerwallabag.git

2. Enter Repo Directory

    cd dockerwallabag

3. Build Image

    sudo docker build -t docker-wallabag .
