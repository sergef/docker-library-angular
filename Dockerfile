FROM sergef/docker-library-nginx:1.12.1.2

ARG NPM_REPO=https://registry.npmjs.org/

WORKDIR /application
COPY application /application
COPY scripts /scripts
COPY entrypoints /entrypoints

RUN chmod +x /scripts/*.sh \
  && chmod +x /entrypoints/*.sh

ONBUILD ARG NPM_REPO=https://registry.npmjs.org/
ONBUILD ENV NPM_REPO=${NPM_REPO}

ONBUILD ARG TARGET=release
ONBUILD ENV TARGET=${TARGET}

ONBUILD ARG BASE_URL=/
ONBUILD ENV BASE_URL=${BASE_URL}

ONBUILD ENV HOST 0.0.0.0
ONBUILD ENV PORT 80

ONBUILD EXPOSE ${PORT}

ONBUILD COPY ./src /application/src

ONBUILD RUN \
  cp /entrypoints/${TARGET}.sh /entrypoint.sh \
  && /scripts/${TARGET}.sh

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
