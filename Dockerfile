FROM rocker/r-ver:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libssl-dev \
  libxml2-dev

ADD ./packrat /csdockertest/packrat
RUN R --vanilla --slave -f "packrat/init.R" --args --bootstrap-packrat

ADD . /csdockertest
