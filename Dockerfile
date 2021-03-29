FROM node:14.15.5 AS WEB-APP
# set the work directory
WORKDIR /usr/src/app
# copy webapp folder
COPY WebApp/ ./WebApp/
# RUN npm install for node js dependencies
RUN cd WebApp \
&& npm install @angular/cli \
&& npm install && npm run build

RUN export CLOUDSDK_PYTHON=python2

FROM node:14.15.5 AS server-build
WORKDIR /root/
COPY --from=WEB-APP /usr/src/app/WebApp/dist ./WebApp/dist
COPY package*.json ./
RUN npm install
COPY index.js .

#COPY --from=nginx:latest

EXPOSE 3070

ENTRYPOINT ["node"]
CMD ["index.js"]

# docker build -t nodewebapp:v1
# ./dockerbuild.shdocke 
# docker run -it -d -p 3070:3070 nodewebapp:v2
