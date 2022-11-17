# Docker environment for _Robot Planning and its Application_
This repository contains the tools to create and use a customized Docker environment for the _Robot Planning and its Applications_ course @ University of Trento.

## Features
* A Docker image that builds upon the `pla10/ros2_humble:amd64` provided during the course, which includes out-of-the-box:
    * Visual Studio Code
    * Nano
    * Git
* Scripts to easily manage the Docker container.
* Quality-of-life changes like:
    * Setup scripts sourced automatically when connecting to the container (e.g. setup ROS2, setup ROS_DOMAIN_ID environment variable, setup installed packages).
    * A shared volume between your machine and the container, to persist anything put in there.
    * SSH agent (with keys and everything else) shared between your machine and the container, to easily manage your Git repositories.

## Setup
1. Clone this repository in a folder of your choice.
2. Add the following lines to the `.bashrc` file on your machine:

    ```
    export ROBOPLAN_DIR=<path-to-repository>
    alias roboplan-run="$ROBOPLAN_DIR/run.sh"
    alias roboplan-stop="$ROBOPLAN_DIR/stop.sh"
    alias roboplan-update="$ROBOPLAN_DIR/update_image.sh"
    export ROBOPLAN_VOLUME=<path-to-shared-folder>
    ```

    Replace the following strings:
    * `<path-to-repository>`: the path to the folder of this repository, that you just cloned.
    * `<path-to-shared-folder>`: the path to the folder that will be shared between your machine and the docker container. Files put in this folder will appear inside the container in the `/root/shared` folder, and will persist even when stopping the container.

    Here is an example:
    ```
    export ROBOPLAN_DIR=$HOME/uni/roboplan-docker-unitn
    alias roboplan-run="$ROBOPLAN_DIR/run.sh"
    alias roboplan-stop="$ROBOPLAN_DIR/stop.sh"
    alias roboplan-update="$ROBOPLAN_DIR/update_image.sh"
    export ROBOPLAN_VOLUME=$ROBOPLAN_DIR/shared
    ```

## Usage
The repository contains 3 scripts:
* `run.sh`: use it to run the container, or attach to it if it is already running. The optional flag `-f` can be used to force the recreation of a new container, deleting the existing one.
* `stop.sh`: use it to stop and remove the running container.
* `update_image.sh`: use it to update the docker image; for example, when the professor updates the `pla10/ros2_humble:amd64` image.

You can use the aliases that you setup in the previous step to run these scripts.

## Known problems
* Sometimes, the ROS2 setup when starting the container will fail. Just launch again the run script and it should work now.