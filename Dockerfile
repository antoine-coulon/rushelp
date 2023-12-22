
FROM node:18 as build

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

COPY .git/ .git/

RUN echo "Building $PROJECT"
RUN echo "Project code: $CODE"

WORKDIR /build

COPY ./apps ./apps
COPY ./libraries ./libraries
COPY ./tools ./tools
COPY ./common/config ./common/config
COPY ./common/git-hooks ./common/git-hooks
COPY ./common/scripts ./common/scripts
COPY ./rush.json ./rush.json
COPY ./.gitignore ./.gitignore


WORKDIR /rush

RUN git clone https://github.com/microsoft/rushstack.git
