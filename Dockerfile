# Use latest node version 8.x
FROM node:8.10.0

MAINTAINER Anand Pratap Singh<anandsngh.6575@gmail.com>

# create app directory in container
RUN mkdir -p /app

# set /app directory as default working directory
WORKDIR /app

# only copy package.json initially so that `RUN yarn` layer is recreated only
# if there are changes in package.json
ADD package.json yarn.lock /app/

RUN npm install -g ethereumjs-testrpc truffle

# --pure-lockfile: Don’t generate a yarn.lock lockfile
RUN yarn --pure-lockfile

# copy all file from current dir to /app in container
COPY . /app/

# expose port 4041
EXPOSE 4041

# cmd to start service
CMD [ "yarn", "start" ]
