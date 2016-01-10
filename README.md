ReproPhylo
========== 
ReproPhylo, a reproducible phylogenetics pipeline 
  
This Dockerfile is an extension of the Ipython-notebook Dockerfile. Thanks to the MAINTAINER IPython Project <ipython-dev@scipy.org>.  
  

Installation without Docker
==========================
The following instructions have Ubuntu in mind. Following them will download RAxML, TrimAl, exonerate and BayesTraits from the Dockerfile repository and will put their directory in PATH. If they are already installed on your system you can skip this step. The same directory will be included in PYTHONPATH, as it has the ReproPhylo scripts.

### Update you system

`sudo apt-get update -y`  
`sudo apt-get upgrade -y`  
`sudo apt-get update -y -qq --fix-missing`  

### Python and IPython dependencies
  
`sudo apt-get install -y -q build-essential make gcc zlib1g-dev git python\`  
`python-dev python-pip`  
`sudo apt-get install -y -q libzmq3-dev sqlite3 libsqlite3-dev pandoc\`   
`libcurl4-openssl-dev nodejs`  

### Jupyter notebook
`sudo pip install ipython[notebook]`  
`sudo pip install --upgrade ipython[notebook]`  

### Git

`sudo apt-get install git`  

### Biopython

`sudo apt-get install python-setuptools python-numpy python-qt4\`  
`python-scipy python-mysqldb python-lxml -y`  
`sudo apt-get install python-biopython -y` 

### ReproPhylo
`sudo pip install reprophylo` 

### ETE2

`sudo pip install -q ete2`  

### Dendropy

`sudo pip install -q dendropy`  

### Pandas

`sudo pip install pandas`  

### matplotlib

`sudo apt-get build-dep python-matplotlib -y`  
`sudo apt-get install python-matplotlib -y`  

### mafft

`sudo apt-get install mafft -y`  

### muscle

`sudo apt-get install muscle -y`  

### RAxML, phylobayes, TrimAl, exonerate, BayesTraits, pal2nal

Any of the above can be installed into your path to be recognized by reprophylo.  
If they are on your machine but not in your path, reprophylo allows you to specify 
the full path to the executable in your reprophylo script. 
    
Or, you can follow these instructions to get them all installed:

#### Get the Dockerfile archive
`cd ~`  
`wget -c https://github.com/HullUni-bioinformatics/ReproPhyloDockerfile/archive/master.zip`  

#### Extract the archive
`unzip master.zip`  
`rm master.zip`  

#### Allow execution of binaries
`cd ReproPhyloDockerfile-master`  
`chmod a+x BayesTraitsV2 exonerate raxmlHPC raxmlHPC-PTHREADS-AVX\`  
`raxmlHPC-PTHREADS-SSE3 readal trimal pb tracecomp bpcomp`  

#### Add to PATH and PYTHONPATH

`echo 'export PATH="$PATH:~/ReproPhyloDockerfile-master"' >> ~/.bashrc`  
`echo 'export PYTHONPATH="$PYTHONPATH:~/ReproPhyloDockerfile-master"' >> ~/.bashrc`  
`source ~/.bashrc`   

You should now be able to start jupyter notebook with   
`ipython notebook`  
in any location and use reprophylo as described in the manual  
