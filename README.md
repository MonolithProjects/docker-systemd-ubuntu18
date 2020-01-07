# Ubuntu16 Ansible Test Image

<a href="https://github.com/MonolithProjects/docker-systemd-ubuntu16/actions"><img src="https://github.com/MonolithProjects/docker-systemd-ubuntu16/workflows/Dockerfile%20test/badge.svg?branch=master"/></a>
<a href="https://hub.docker.com/repository/docker/monolithprojects/systemd-ubuntu16"><img src="https://img.shields.io/microbadger/image-size/monolithprojects/systemd-ubuntu16/master"/></a>
<a href="https://hub.docker.com/repository/docker/monolithprojects/systemd-ubuntu16"><img src="https://img.shields.io/docker/pulls/monolithprojects/systemd-ubuntu16"/></a>
<a href="https://hub.docker.com/repository/docker/monolithprojects/systemd-ubuntu16"><img src="https://img.shields.io/docker/cloud/automated/monolithprojects/systemd-ubuntu16?maxAge=2592000"/></a>

Ubuntu16 docker image (based on actual base image version). I am using it with Molecule for Ansible role testing.

## Tags

  - `latest`: Latest version of the image


## How-to

  1. Run command `docker pull monolithprojects/systemd-ubuntu16:latest`  
  2. Run a container from the image: `docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro monolithprojects/systemd-ubuntu16:latest`  

## License

MIT
