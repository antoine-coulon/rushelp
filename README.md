# Rush sandbox

This template aims to simplify Rush contributions by providing a Docker environment where we both
have the `rushstack` monorepo in `/rush` directory and a dummy Rush monorepo setup located in `/build` 
which is simply a copy of the current repository.

# Getting started

This setup needs Docker to be installed then the Dockerfile provides everything for the Rush environment to be ready.

```sh
docker build . -f Dockerfile -t rush-sandbox
docker run -it <rush-sandbox-image-id> /bin/bash 
```

**devcontainers**

Not yet available.