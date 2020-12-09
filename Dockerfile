############Dockerfile###########
FROM openjdk:8

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git 
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y tar

RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip

####neo4j
RUN pip3 install neo4j==4.1.1
RUN wget http://neo4j.com/artifact.php?name=neo4j-community-3.5.12-unix.tar.gz
RUN tar -xf 'artifact.php?name=neo4j-community-3.5.12-unix.tar.gz'
WORKDIR /

RUN pip3 install gdown
RUN apt-get install -y bzip2
RUN pip3 install rdflib==5.0.0
RUN pip3 install requests==2.24.0
RUN pip3 install pyspark==3.0.1
RUN pip3 install pandas==1.1.3
WORKDIR /

RUN wget http://downloads.dbpedia.org/2016-10/core-i18n/ar/mappingbased_objects_ar.ttl.bz2
RUN bzip2 -d mappingbased_objects_ar.ttl.bz2

RUN wget http://downloads.dbpedia.org/2016-10/core-i18n/ar/instance_types_ar.ttl.bz2
RUN bzip2 -d instance_types_ar.ttl.bz2

RUN grep "dbpedia\.org\/ontology\/" mappingbased_objects_ar.ttl > mappingbased_objects_ar_ontology.ttl

RUN echo "sdgng k"

RUN git clone https://github.com/yanliang12/yan_neo4j_docker.git
RUN mv /yan_neo4j_docker/* ./
RUN rm -r yan_neo4j_docker

RUN git clone https://github.com/gaoyuanliang/jessica_dbpedia_arabic.git
RUN mv /jessica_dbpedia_arabic/* ./
RUN rm -r jessica_dbpedia_arabic

CMD bash
############Dockerfile############
