FROM ubuntu:15.10
RUN apt update; apt install -y git ruby gcc ruby-dev rake make wget python python-dev g++
RUN cd; git clone git://github.com/bioruby/bioruby; cd bioruby; gem build bioruby.gemspec; gem install ./bio-1.5.1.20150917.gem

# jupyter
RUN wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; pip install jupyter
# iruby
RUN apt install -y libzmq3-dev libtool-bin autoconf; gem install rbczmq iruby pry

EXPOSE 8888
CMD iruby notebook --no-browser --ip='*' --port 8888
