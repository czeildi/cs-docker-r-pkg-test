FROM rocker/r-ver:latest

RUN mkdir /csdockertest
WORKDIR /csdockertest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libcurl4-openssl-dev \
  zlib1g-dev \
  libssl-dev \
  libxml2-dev


RUN mkdir -p $HOME/cache/packrat/lib
RUN mkdir -p $HOME/cache/packrat/lib-R
RUN mkdir -p $HOME/cache/packrat/lib-ext
RUN mkdir -p /csdockertest/packrat/lib
RUN mkdir -p /csdockertest/packrat/lib-R
RUN mkdir -p /csdockertest/packrat/lib-ext

RUN cp -r $HOME/cache/packrat/lib /csdockertest/packrat/
RUN cp -r $HOME/cache/packrat/lib-R /csdockertest/packrat/
RUN cp -r $HOME/cache/packrat/lib-ext /csdockertest/packrat/

ADD ./packrat/packrat.lock /csdockertest/packrat/packrat.lock

RUN R -e "0" --args --bootstrap-packrat
RUN R -e "packrat::restore(restart = FALSE)"
RUN cp -r /csdockertest/packrat/lib $HOME/cache/packrat
RUN cp -r /csdockertest/packrat/lib-R $HOME/cache/packrat
RUN cp -r /csdockertest/packrat/lib-ext $HOME/cache/packrat

ADD . /csdockertest
