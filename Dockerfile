FROM node:18-bullseye

# Install nginx
RUN apt-get update \
  && apt-get install -y nginx --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g pnpm

# We copy the code from the docker-compose-yml
# RUN git clone https://github.com/bitshares/bitshares-ui.git /bitshares-ui
CMD mkdir /bitshares-ui
WORKDIR /bitshares-ui

COPY charting_library ./charting_library

COPY . .
RUN pnpm install --prefer-frozen-lockfile
RUN pnpm run build

EXPOSE 80

## Copying default configuration
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/start.sh /start.sh
RUN chmod a+x /start.sh

## Entry point
ENTRYPOINT ["/start.sh"]
