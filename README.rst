Elasticsearch
=======

Elasticsearch
-------

Install elasticsearch from the elasticsearch repos 

-------------

Add a jenkins nginx entry. 

pillar customizations available:

    elasticsearch:
      cluster: clustername
      paths:
       conf: /etc/elasticsearch
       data: /var/lib/elasticsearch
       logs: /var/log/elasticsearch
