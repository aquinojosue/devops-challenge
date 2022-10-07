FROM alpine

WORKDIR /app
ADD . /app
RUN apk add --update yarn && \
    yarn install && yarn build

ENTRYPOINT ["yarn", "start"]

EXPOSE 3001