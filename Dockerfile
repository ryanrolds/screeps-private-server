FROM node:10-alpine

ARG USER=ryanrolds
ARG REPO=screeps-bot-choreographer
ARG BRANCH=main

# Required or setup of isolated-vm barfs with permission error
ENV NPM_CONFIG_PREFIX=/pserver/.npm-global
# optionally if you want to run npm global bin without specifying path
ENV PATH=$PATH:/pserver/.npm-global/bin 

RUN apk update
RUN apk add --no-cache python2 make g++

WORKDIR /pserver

COPY package.json package-lock.json ./
RUN npm install
RUN npm install https://github.com/$USER/$REPO/tarball/$BRANCH --save

COPY . .
RUN mkdir logs

EXPOSE 21025
EXPOSE 21026

CMD ["npx", "screeps", "start"]