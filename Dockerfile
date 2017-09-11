FROM rocker/r-base:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

Add . /csdockertest

RUN R -e "0" --args --bootstrap-packrat
