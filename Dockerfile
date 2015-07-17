# Using the Ubuntu image
FROM ubuntu:14.04

MAINTAINER Amir Szitenberg <a.szitenberg@hull.ac.uk>

# Some hints for manual installation:
#####################################

# "RUN" lines:
# have to be run as command lines, ommiting the 'RUN'
# and possibly using sudo

# "ENV" lines:
# set environment variable. The first word is the
# variable name, the second is the value.
# Here are links about how to do it in Ubuntu:
#
#

# The "ENV PYTHONPATH" line:
# PYTHONPATH is an envorinment variable telling
# Python where to look for Python modules
# The value of this variable should be:
# /path/to/python-files:$PYTHONPATH
# This will add the path of your choice to the already
# existing paths list. 
# Put all the files ending with .py in the path you added 
# to PYTHONPATH

# The "ENV PATH" line:
# PATH is an envorinment variable telling
# linux where to look for executables
# If you put executables in e.g. /usr/bin
# you do not need to modify the PATH variable
# as /usr/bin is already included.
# You can copy executables to /usr/bin using:
# cd ReproPhylo
# sudo cp trimal /usr/bin/.
# If you want to put these executables in a location
# that is not yet in PATH, then
# The value of this variable should be:
# /path/to/executables:$PATH
# This will add the path of your choice to the already
# existing paths list.

 
# Make sure apt is up to date
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get update -y -qq --fix-missing
 
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

# css
ADD css.py /home/reprophylo/

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

# exonerate
ADD exonerate /home/reprophylo/
RUN chmod a+x /home/reprophylo/exonerate

# BayesTraitsV2
ADD BayesTraitsV2 /home/reprophylo/
RUN chmod a+x /home/reprophylo/BayesTraitsV2

# pal2nal
ADD pal2nal.pl /home/reprophylo/
RUN chmod a+x /home/reprophylo/pal2nal.pl

VOLUME /notebooks
WORKDIR /notebooks
RUN chmod -R a+rw /notebooks

# ipython notebook
RUN pip install ipython[notebook]
RUN pip install --upgrade ipython[notebook]

EXPOSE 8888

# You can mount your own SSL certs as necessary here
ENV PEM_FILE /key.pem
ENV PASSWORD Dont make this your default

ADD notebook.sh /
RUN chmod u+x /notebook.sh

CMD /notebook.sh

