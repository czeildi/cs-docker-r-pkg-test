FROM rocker/r-ver:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libssl-dev \
  libxml2-dev

ADD packrat/packrat.lock /csdockertest/packrat/packrat.lock

RUN R -e "0" --args --bootstrap-packrat
RUN R -e "packrat::restore()"

Add . /csdockertest
