
FROM node:18 as build

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y vim && \
    apt-get install -y mc


COPY .git/ .git/

RUN corepack enable

RUN npm install -g @microsoft/rush@5.112.2

WORKDIR /build

COPY ./apps ./apps
COPY ./libraries ./libraries
COPY ./tools ./tools
COPY ./common/config ./common/config
COPY ./common/git-hooks ./common/git-hooks
COPY ./common/scripts ./common/scripts
COPY ./rush.json ./rush.json
COPY ./.gitignore ./.gitignore

RUN rush install --bypass-policy

WORKDIR /rush

RUN git clone https://github.com/microsoft/rushstack.git

WORKDIR /rush/rushstack

RUN rush install --bypass-policy 
RUN rush build --from @microsoft/rush

WORKDIR /rush/rushstack/apps/rush

RUN pnpm link --global


