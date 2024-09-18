FROM alpine:3.18.0


RUN apk upgrade
RUN apk add sudo util-linux

RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

RUN apk add -U shadow

RUN apk add --no-cache --virtual .ruby-builddeps \
		autoconf \
		bison \
		bzip2 \
		bzip2-dev \
		ca-certificates \
		coreutils \
		dpkg-dev dpkg \
		g++ \
		gcc \
		gdbm-dev \
		glib-dev \
		libc-dev \
		libffi-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		ncurses-dev \
		openssl \
		openssl-dev \
		patch \
		procps \
		tar \
		xz \
		yaml-dev \
		zlib-dev \
		binutils\
		zeromq-dev\
		git \
		curl \
        sqlite-dev \
        sqlite\
        ;


RUN apk del python3
RUN apk del ruby
RUN adduser -D educar

RUN su educar

WORKDIR /home/educar


USER educar

RUN mkdir ${HOME}/local

#ENV PATH=$PATH:/home/educar/bin

###################### start python #########################################################
ARG PYTHON_VERSION=3.11.1

RUN cd ${HOME}/local \
    && wget https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \                                              
    && tar xzf Python-${PYTHON_VERSION}.tgz

RUN mkdir ${HOME}/local/python

# build python and remove left-over sources
RUN cd ${HOME}/local/Python-${PYTHON_VERSION} \ 
    && ./configure --prefix=${HOME}/local/python --enable-optimizations --with-ensurepip=install  --enable-loadable-sqlite-extensions \
    && make install \
    && rm ${HOME}/local/Python-${PYTHON_VERSION}.tgz ${HOME}/local/Python-${PYTHON_VERSION} -rf

ENV PATH=$PATH:/home/educar/local/python/bin

RUN pip3.11 install ipython
RUN pip3.11 install jupyter
RUN pip3.11 install numpy
RUN pip3.11 install matplotlib
RUN pip3.11 install bokeh
RUN pip3.11 install plotly
RUN pip3.11 install pandas
RUN pip3.11 install scipy
RUN pip3.11 install injector
RUN pip3.11 install pyzmq


#################### end python #############################################################

##################### start golang ##########################################################
ARG GOLANG_VERSION=1.21.0

RUN cd ${HOME}/local &&  wget https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
    tar -xzvf go${GOLANG_VERSION}.linux-amd64.tar.gz 
    


ENV  PATH=$PATH:/home/educar/local/go/bin
ENV GOPATH=/home/educar/local/go

RUN   go install github.com/gopherdata/gophernotes@v0.7.5


RUN mkdir -p  ${HOME}/.local/share/jupyter/kernels/gophernotes
RUN cp $(go env GOPATH)/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/* ${HOME}/.local/share/jupyter/kernels/gophernotes/;
RUN chmod 766  ${HOME}/.local/share/jupyter/kernels/gophernotes/*
RUN cd ${HOME}/.local/share/jupyter/kernels/gophernotes &&  sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json;

##################### end golang ##########################################################

##################### start ruby ##########################################################

#no son las mismas versiones la que quedan en el contenedor 

ENV LANG C.UTF-8
ENV RUBY_MAJOR 3.3
ENV RUBY_VERSION 3.3.5

RUN cd ${HOME} &&  wget "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR}/ruby-${RUBY_VERSION}.tar.gz"

RUN tar xzvf ruby-3.3.5.tar.gz

RUN mv ruby-3.3.5 local/;
RUN cd local/ruby-3.3.5 && ./configure  --prefix=$HOME/local/ruby  && make && make install ; 

ENV PATH=$PATH:/home/educar/local/ruby/bin



RUN ruby --version; \
	gem --version; 

RUN gem install rake
RUN gem install ffi
RUN gem install iruby



##################### end ruby ##########################################################


COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]