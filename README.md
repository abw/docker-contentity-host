# triksox/contentity-host Docker Image

This repository contains the [Dockerfile](Dockerfile) and some supporting
scripts for creating a Docker image that contains all the system software
and Perl modules required to run the Contentity web application framework
under Apache/mod_perl.

Including:

* Apache
* mod_perl
* numerous CPAN Perl modules
* badger-database Perl modules
* contentity Perl modules

The Docker image created is [triksox/contentity-host](https://hub.docker.com/repository/docker/triksox/contentity-host) and is based on [triksox/mod_perl](https://hub.docker.com/repository/docker/triksox/mod_perl).

## Instructions to Remind Me What to Do

### Make Your Changes

Make any changes to the [Dockerfile](Dockerfile) or other source
files.

### Set the Version Number

Edit the `VERSION` environment variable in the [.env](.env) file to
increment the version number.

### Build the Image

Run the [docker-build.sh](docker-build.sh) script to build an image.
This uses the [Dockerfile](Dockerfile) to build the image.  It will
take a while.

    $ ./docker-build.sh

The image created will be tagged `triksox/contentity-host:N.N.N` where
`N.N.N` is the version number defined in the [.env](.env) file.

### Run a Container

Run the [docker-run.sh](docker-run.sh) script to start a Docker container using the image
created in the previous step.

    $ ./docker-run.sh

### Push to Docker Hub

Run the [docker-push.sh](docker-push.sh) script to push the image to Docker Hub.

    $ ./docker-push.sh

