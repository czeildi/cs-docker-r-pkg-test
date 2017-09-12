FROM rocker/r-ver:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libssl-dev \
  libxml2-dev

RUN mkdir /rpkg
WORKDIR /rpkg

ADD ./packrat /rpkg/packrat
RUN R --vanilla --slave -f "packrat/init.R" --args --bootstrap-packrat

ADD . /rpkg
