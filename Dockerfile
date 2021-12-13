FROM node:12-alpine

# Required or setup of isolated-vm barfs with permission error
ENV NPM_CONFIG_PREFIX=/pserver/.npm-global
# optionally if you want to run npm global bin without specifying path
ENV PATH=$PATH:/pserver/.npm-global/bin 

RUN apk add --no-cache python make g++

WORKDIR /pserver

COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN mkdir logs
#RUN chown -R node:node .

EXPOSE 21025
EXPOSE 21026

CMD ["npx", "screeps", "start"]