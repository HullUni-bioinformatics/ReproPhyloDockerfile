# Using the Ubuntu image
FROM ubuntu:14.04

MAINTAINER Amir Szitenberg <a.szitenberg@hull.ac.uk>
 
# Make sure apt is up to date
RUN apt-get update
RUN apt-get upgrade -y
 
# Not essential, but wise to set the lang
RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
 
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
 
# Python binary dependencies, developer tools
RUN apt-get install -y -q build-essential make gcc zlib1g-dev git python python-dev python-pip
RUN apt-get install -y -q libzmq3-dev sqlite3 libsqlite3-dev pandoc libcurl4-openssl-dev nodejs


# git
RUN apt-get install git


# biopython
RUN apt-get install python-setuptools python-numpy python-qt4 python-scipy python-mysqldb python-lxml -y
RUN apt-get install python-biopython -y

# ete2
RUN pip install -q ete2

# dendropy
RUN pip install -q dendropy

# cloud
RUN pip install -q cloud

# pandas
RUN pip install pandas

# matplotlib
RUN apt-get build-dep python-matplotlib -y
RUN apt-get install python-matplotlib -y

# mafft
RUN apt-get install mafft -y

# muscle
RUN apt-get install muscle -y

# reprophylo
RUN mkdir /home/reprophylo/
ENV PYTHONPATH /home/reprophylo:$PYTHONPATH
ENV PATH /home/reprophylo:$PATH
ADD reprophylo.py /home/reprophylo/
ADD rpgit.py /home/reprophylo/
ADD gb_syn.py /home/reprophylo/

# HTML
ADD HTML.py /home/reprophylo/

# raxml
ADD raxmlHPC /home/reprophylo/
RUN chmod a+x /home/reprophylo/raxmlHPC
ADD raxmlHPC-PTHREADS-AVX /home/reprophylo/
RUN chmod a+x /home/reprophylo/raxmlHPC-PTHREADS-AVX
ADD raxmlHPC-PTHREADS-SSE3 /home/reprophylo/
RUN chmod a+x /home/reprophylo/raxmlHPC-PTHREADS-SSE3

# trimal
ADD trimal /home/reprophylo/
RUN chmod a+x /home/reprophylo/trimal
ADD readal /home/reprophylo/
RUN chmod a+x /home/reprophylo/readal

# pal2nal
ADD pal2nal.pl /home/reprophylo/
RUN chmod a+x /home/reprophylo/pal2nal.pl

VOLUME /notebooks
WORKDIR /notebooks

# ipython notebook
RUN pip install ipython[notebook]

EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem
ENV PASSWORD Dont make this your default

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD /notebook.sh

