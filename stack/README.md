Notes about using Stack.

# Install

Run this command in the terminal

`curl -sSL https://get.haskellstack.org/ | sh`

# Quick Guide

Generally the commands needed are:

```
stack install [optional: package names, or refer to the package.yml file]
stack build
stack clean
stack configure
stack setup
```

# use with Docker

1) pull the base stack docker image

`docker pull fpco/stack-build`

2) update the `stack.yml` file with the following section:

```
docker:
    enable: true
    registry-login: false
    image: fpco/stack-build # this was previously pulled
```

Note that steps 1 and 2 could be done in any order. You can check to see existing docker images with `docker image ls`

then you can run `stack build`
