Elasticsearch
=======

Elasticsearch
-------

Install elasticsearch from the elasticsearch repos 

so far this has only been tested on centos 6.5
-------------


pillar customizations available:

    elasticsearch:
      cluster: clustername
      paths:
       conf: /etc/elasticsearch
       data: /var/lib/elasticsearch
       logs: /var/log/elasticsearch
