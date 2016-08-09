FROM                node:latest

MAINTAINER          Ismar Slomic <ismar.slomic@accenture.com>

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends git \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV BRIDGE_HOME         /var/jira-matter-bridge

RUN mkdir -p            ${BRIDGE_HOME} \
    && chmod -R 700     ${BRIDGE_HOME}

WORKDIR                 $BRIDGE_HOME

RUN                     git clone https://github.com/vrenjith/jira-matter-bridge ${BRIDGE_HOME}\
                        && npm install

EXPOSE                  3000
CMD                     ["npm", "start"]