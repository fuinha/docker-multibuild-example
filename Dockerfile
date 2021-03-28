FROM node:14.15.5 AS ui-build
# set the work directory
WORKDIR /usr/src/app
# copy webapp folder
COPY WebApp/ ./WebApp/
# RUN npm install for node js dependencies
RUN cd WebApp \
&& yarn add @angular/cli \
&& yarn install && yarn build


FROM node:14.15.5 AS server-build
WORKDIR /root/
COPY --from=ui-build /usr/src/app/WebApp/dist ./WebApp/dist
COPY package*.json ./
RUN yarn install
COPY index.js .

#COPY --from=nginx:latest

EXPOSE 3070

ENTRYPOINT ["node"]
CMD ["index.js"]

# docker build -t nodewebapp:v1
# ./dockerbuild.shdocke 
# docker run -it -d -p 3070:3070 nodewebapp:v2
