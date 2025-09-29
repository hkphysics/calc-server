FROM redmine AS build
WORKDIR /usr/src/redmine/plugins
RUN git clone https://github.com/kontron/redmine_oauth.git ; \
 git clone https://github.com/hkphysics/easy_gantt_pro ; \
 git clone https://github.com/hkphysics/easy_gantt

# Install build-essential to build dependencies of redmine_oauth
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get upgrade \
 && apt-get install --yes --no-install-recommends build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/cache/apt/*
RUN bundle install

# Final stage with only necessary packages
FROM redmine:latest

COPY --from=build /usr/src/redmine/plugins /usr/src/redmine/plugins
COPY --from=build /usr/local/bundle /usr/local/bundle
ENV PATH=$PATH:/usr/local/bin