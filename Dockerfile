FROM java:7-jre
RUN  apt-get install -y wget
RUN wget http://scala-lang.org/files/archive/scala-2.11.6.deb && \
     dpkg -i scala-2.11.6.deb

RUN apt-get install -y wget
RUN wget http://downloads.typesafe.com/zinc/0.3.7/zinc-0.3.7.tgz

RUN tar -xvzf zinc-0.3.7.tgz
RUN cd zinc-0.3.7/bin && \
     ls && \
     chmod +x ./zinc

EXPOSE 3030
COPY run.sh .
RUN chmod +x ./run.sh

CMD ["./run.sh"]
