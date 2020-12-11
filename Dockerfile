############Dockerfile###########
FROM openjdk:8

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git 
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y tar
RUN apt-get install -y bzip2

RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip

####neo4j
RUN pip3 install neo4j==4.1.1
RUN pip3 install gdown==3.12.2
RUN pip3 install rdflib==5.0.0
RUN pip3 install requests==2.24.0
RUN pip3 install pyspark==3.0.1
RUN pip3 install pandas==1.1.3
RUN pip3 install elasticsearch==7.10.1
RUN pip3 install stanza==1.1.1

WORKDIR /

####

RUN mkdir /home/jessica
RUN chmod 777 /home/jessica

RUN useradd -u 8877 jessica
USER jessica

#####
RUN python3 -c "import stanza;stanza.download('ar')"

####

WORKDIR /home/jessica/
RUN wget http://neo4j.com/artifact.php?name=neo4j-community-3.5.12-unix.tar.gz
RUN tar -xf 'artifact.php?name=neo4j-community-3.5.12-unix.tar.gz'

####

WORKDIR /home/jessica/
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.6.1.tar.gz
RUN tar xvzf elasticsearch-5.6.1.tar.gz

EXPOSE 8865/tcp

####configure the elasticsearch
WORKDIR /home/jessica/
RUN echo "transport.host: localhost" > elasticsearch-5.6.1/config/elasticsearch.yml
RUN echo "transport.tcp.port: 8866" >> elasticsearch-5.6.1/config/elasticsearch.yml
RUN echo "http.port: 8865" >> elasticsearch-5.6.1/config/elasticsearch.yml
RUN echo "network.host: 0.0.0.0" >>elasticsearch-5.6.1/config/elasticsearch.yml

####
WORKDIR /home/jessica/
RUN wget http://downloads.dbpedia.org/2016-10/core-i18n/ar/mappingbased_objects_ar.ttl.bz2
RUN bzip2 -d mappingbased_objects_ar.ttl.bz2

RUN wget http://downloads.dbpedia.org/2016-10/core-i18n/ar/instance_types_ar.ttl.bz2
RUN bzip2 -d instance_types_ar.ttl.bz2

RUN grep "dbpedia\.org\/ontology\/" mappingbased_objects_ar.ttl > mappingbased_objects_ar_ontology.ttl

####flask
WORKDIR /home/jessica/
RUN pip3 install Werkzeug==0.16.1
RUN pip3 install flask==1.1.2
RUN pip3 install flask_restplus==0.13.0
RUN git clone https://github.com/gaoyuanliang/jessica_flusk.git
RUN mv jessica_flusk/* ./

####

ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3

####

###download the es file ready for search
RUN echo "dgsdngkisrjtonk"

RUN gdown https://drive.google.com/uc?id=1Waki4UC-SpN0zqAhAGhh_GWBny0uEbeS
RUN unzip elasticsearch-5.6.1_dbpedia_arabic_entity.zip

###

RUN git clone https://github.com/gaoyuanliang/jessica_arabic_knowledge_graph.git
RUN mv jessica_arabic_knowledge_graph/* ./
RUN rm -r jessica_arabic_knowledge_graph

RUN git clone https://github.com/yanliang12/yan_ner_docker.git
RUN mv yan_ner_docker/* ./
RUN rm -r yan_ner_docker

CMD python3 app_path.py
############Dockerfile############
