{% set es = pillar.get('elasticsearch', {}) -%}
{% set version = es.get('version', 1.1) -%}

/etc/elasticsearch/elasticsearch.yml:
  file:
    - managed
    - template: jinja
    - source: salt://elasticsearch/files/elasticsearch.yml
    - require:
      - pkg: elasticsearch

/etc/elasticsearch/logging.yml:
  file:
    - managed
    - template: jinja
    - source: salt://elasticsearch/files/logging.yml
    - require:
      - pkg: elasticsearch

elasticsearch:
  pkgrepo.managed:
    - humanname: Elastic Search Repo
    {% if grains['os_family'] == 'RedHat' %}
    - baseurl: http://packages.elasticsearch.org/elasticsearch/{{ version }}/centos
    - gpgkey: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    {% elif grains['os_family'] == 'Debian' %}
    - name: deb http://packages.elasticsearch.org/elasticsearch/{{ version }}/debian stable main
    - key_url: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    {% endif %}
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: elasticsearch
  service.running:
    - enable: True
    - watch:
      - pkg: elasticsearch
