ReproPhylo
========== 
ReproPhylo, a reproducible phylogenetics pipeline 
  
This Dockerfile is an extension of the Ipython-notebook Dockerfile. Thanks to the MAINTAINER IPython Project <ipython-dev@scipy.org>.  
  
so far installed software
-------------------------
reprophylo V-alpha  
RAxML(HPC, HPC-PTHREADS-AVX/SSE3) 8.0.12   
trimal 1.2  
pal2na.pll 14  
HTML.py 0.04  
  
**current pip versions:**  
Ipython-notebook  
ETE  
dendropy  
cloud  
pandas  
 
**current apt-get versions:**  
muscle  
mafft  
git  
python-biopython  
python-matplotlib  
python-numpy  




how to download and install
---------------------------
Not yet available  
  
how to build
------------

`sudo docker build -t reprophylo .`

how to use
----------
  
`docker run --name rpnotebook -d -p 8888:8888 -e "PASSWORD=password" -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /path/to/your/project:/notebooks -e DISPLAY=$DISPLAY reprophylo`
  
do
  
`xhost +local:root`
  
on your local machine


about
----- 
If you are looking for containerized bioinformatics software 
visit the [Bio Docker](http://biodocker.github.io "Bio Docker")
  
  