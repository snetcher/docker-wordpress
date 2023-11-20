## Installation

## Docker

The first step is to get Docker. You can get Docker from here:

* Windows: https://www.docker.com/docker-windows
* MacOS: https://www.docker.com/docker-mac
* Other: https://www.docker.com/get-docker

Once Docker is installed you should be able to run the following from command line (terminal / cmd.exe):

```shell
docker -v
```

## Git

Follow the instructions on the website https://gitforwindows.org/.

After installing `Git` you can not only use its obvious advantages: but also `Git Bash` on Windows systems.

To check the functionality of Git, let's check its version:

```shell
git -v
```

## `make` for Windows

1. Install https://community.chocolatey.org/courses/installation/installing (Select "Install from PowerShell v3+")
2. Install **make** `choco install make`

(Source: https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows#32127632)

You can do without make, but you will have to use longer commands if you do so.

## Setting up your site

Go to any of your project folders and then run the following (replacing my-site with whatever you wish):

```shell
git clone https://github.com/<MY_GIT_REPOSITORY> my-site
cd my-site
```

### First start.

```shell
make build
```

_If you are not using the make utility._

```shell
docker-compose up -d --build
```

|| Note: At the first start, SSL certificates are generated and registered to support operation via the HTTPS protocol.

|| Note: The first time you run `docker-compose` it might take a while to download the Docker images.

### Normal launch.

```shell
make up
```

_If you are not using the make utility._

```shell
docker-compose up -d
```

This will spin up a few Docker containers:

* **webserver** - nginx - Which acts as a proxy for your site and the PHP FPM server.
* **wordpress** - A PHP FPM flavor of the WordPress Docker image.
* **db** - MySQL for serving your WordPress a database.
* **phpmyadmin** - A web interface for your database.

## URLs

The following URLs will now be available for your project:

* http://localhost/ -- Your development WordPress site. (You will install WordPress upon first visit).
* http://localhost:8080/ -- The PHPMyAdmin interface for your database (username: root, password: root)

You can now use your development WordPress site as you would any WordPress site.

## Project Folder Structure

Inside your primary `my-site` project folder you will see the following:

* .env -- Contains container settings and allows you to change their settings.
* docker-compose.yml -- The Docker configuration for your project.
* Makefile -- Provides the ability to more conveniently manage processes.
* README.md -- You are here.
* **wordpress/** -- The WordPress files.
* **db_data/** -- Contains database files.
* **config/**
    * **nginx/**
        * default.conf -- The nginx configuration for your site.
        * Dockerfile -- Configures the use of SSL certificates to support work over the HTTPS protocol.
    * **php/**
        * php.ini -- PHP settings inside the container.
        * www.conf -- User access rights settings.

## Stopping your project

Running the following will stop all active Docker containers:

```shell
make down
```

_If you are not using the make utility._

```shell
docker stop $(docker ps -q)
```

## Issues:

---

- Research Debugging in WordPress -<br>https://wordpress.org/documentation/article/debugging-in-wordpress/
- Fix Critical issues on the page "Site Health" `/wp-admin/site-health.php?tab`:
    - The REST API encountered an error
    - Your site could not complete a loopback request
    - Mailhog