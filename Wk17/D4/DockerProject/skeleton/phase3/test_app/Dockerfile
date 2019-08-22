FROM node:10-alpine

WORKDIR /app

COPY . /app

# RUN apt-get update
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs ssh mysql
RUN npm install

CMD  ["npm", "start"]