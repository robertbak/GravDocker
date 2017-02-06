# Quick start guide

All you should need to do to get a running grav install in a container is:  
```
docker run -p 8080:8080 robertbak/grav
```

The apache in the container is serving grav on port 8080 to make sure you don't 
need any admin permissions to use the port.

## Installing plugins and themes

The easiest way to install plugins is just setting the docker environment variable
called `INSTALL`. This will run the `gpm install` when the docker container is run.

Example: 
```
docker run -p 8080:8080 --env INSTALL="admin" robertbak/grav
```
Will result in a grav install with Admin Panel and dependencies installed availiable
on port 8080.
