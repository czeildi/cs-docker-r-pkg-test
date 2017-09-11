FROM rocker/r-ver:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

Add . /csdockertest
