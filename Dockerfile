FROM node:boron

WORKDIR /gridappsd

RUN npm install -g typescript typings webpack@3.10.0

COPY . /gridappsd/viz/

WORKDIR /gridappsd/viz

RUN npm install  \
    && webpack

ENV VIZ_PORT=8082 
ENV PORT=${VIZ_PORT}
EXPOSE ${VIZ_PORT}

CMD ["npm", "start"]
