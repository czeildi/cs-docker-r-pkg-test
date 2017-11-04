FROM czeildi/r-for-pkg:latest

RUN mkdir /rpkg
WORKDIR /rpkg

ADD ./packrat /rpkg/packrat
RUN R --vanilla --slave -f "packrat/init.R" --args --bootstrap-packrat

ADD . /rpkg
