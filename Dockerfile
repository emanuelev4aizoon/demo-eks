FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
C_OPY nodeapp/* ./
RUN npm install
COPY . .
EXPOSE 1337
CMD [ "node", "server.js" ]
