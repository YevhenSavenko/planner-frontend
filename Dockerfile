# Stage 1: Build
FROM node:20-alpine3.17 as node-app

WORKDIR /app-build

COPY package*.json ./

RUN npm install

COPY ./ .

RUN npm run build

# Stage 2: Serve
FROM nginx:alpine

WORKDIR /app

COPY --from=node-app /app-build/build /app
COPY /docker/nginx.conf /etc/nginx/conf.d/default.conf

# Stage 3: Development
FROM node:20-alpine3.17 as develop

WORKDIR /app

ARG DOCKER_USER_ID=1000
ARG DOCKER_GROUP_ID=1000

COPY docker/develop/entrypoint.sh /
COPY docker/develop/docker-entrypoint.d /docker-entrypoint.d

RUN addgroup --gid ${DOCKER_GROUP_ID} app || echo "Group ${DOCKER_GROUP_ID} already exists." \
    && groupName="$(getent group ${DOCKER_GROUP_ID} | cut -d: -f1)" \
    && adduser --uid ${DOCKER_USER_ID} --ingroup ${groupName} --shell /bin/sh --home /home/app --disabled-password app \
      || echo "User ${DOCKER_USER_ID} already exists." \
    && chown -R $DOCKER_USER_ID:$DOCKER_GROUP_ID /app && \
    chmod -R 0755 /entrypoint.sh /docker-entrypoint.d

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "npm", "run", "start" ]

USER $DOCKER_USER_ID:$DOCKER_GROUP_ID
