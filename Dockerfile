FROM rocker/r-base:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

Add . /csdockertest

RUN apt-get install libcurl4-openssl-dev

RUN R -e "0" --args --bootstrap-packrat
