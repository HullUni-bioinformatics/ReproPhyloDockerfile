ReproPhylo
==========
Working towards a Dokerfile of  
ReproPhylo, a reproducible phylogenetics pipeline 

so far installed software
-------------------------

biopython 1.64  
ete 2.2


how to build
------------

`sudo docker build -t reprophylo .`


how to download and install
---------------------------
Not yet available  


how to use
----------

`docker run --name rpnotebook -d -p 8888:8888 -e "PASSWORD=password" -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /path/to/your/project:/notebooks -e DISPLAY=$DISPLAY reprophylo`

do `xhost +local:root` on your local machine

about
-----
 
If you are looking for containerized bioinformatics software 
visit the [Bio Docker](http://biodocker.github.io "Bio Docker")
