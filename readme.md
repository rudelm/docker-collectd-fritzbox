# Docker container with collectd configured to collect data from Fritzbox
This docker container is a preconfigured collectd with installed fritzcollectd. I use it on my Synology DS218+ to gather longterm connection statistics of my Fritzbox.

## Setup
- Install docker
- Pull the latest image from the Docker registry:
```
docker pull rudelm/collectd-fritzbox
```
- Create a user in Fritzbox used by collectd so that the TR-069 interface can be queried:
```
Now create a user account in the Fritz!Box for collectd. Go to System, Fritz!Box-user and create a new user with password, who has access from internet disabled. The important part is to enable „Fritz!Box settings“.

Additionally make sure that your Fritz!Box is configured to support connection queries using UPnP. You can configure this under „Home Network > Network > Networksettings“. Select „Allow access for applications“ as well as „Statusinformation using UPnP“.
```

## Usage
### Start the container manually:
Be aware that this will leave your used credentials in your bash history! It might be better to use the docker-compose version.
```
docker run -d -e EP_HOST=example.com -e EP_PORT=2003 -e FRITZ_IP=192.168.178.1 -e FRITZ_PASSWORD=<yourpassword> rudelm/collectd-fritzbox
```

### Start the container using the `docker-compose.yml`:
- Modify the environment variables in `docker-compose.yml`according to your setup
- Rename or copy `collectd.env.template` to `collectd.env` and fill it according to your setup
```
docker-compose up
```
- collectd will now be available on your host in the exposed port `25826`.

### Usage with influxdb
I intend to use this container with influxdb so you should use the content from `docker-compose.yml` to setup several container which can be started with a single docker-compose up command.

# Credits
Parts of the config is taken from [collectd-docker](https://github.com/revett/collectd-docker).

# License
[The MIT License (MIT)](http://opensource.org/licenses/MIT)

Copyright (c) 2019 Markus Rudel