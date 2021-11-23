FROM node:16

ENV PORT=3000 APP_DIR=/app

WORKDIR ${APP_DIR}

ADD main.js .
ADD package.json .
ADD package-lock.json .

ADD public public

RUN npm ci

EXPOSE ${PORT}

HEALTHCHECK --interval=60s --timeout=5s --start-period=5s --retries=3 \
	CMD curl -f localhost:${PORT}/healthz || exit 1

ENTRYPOINT [ "node", "main" ]
