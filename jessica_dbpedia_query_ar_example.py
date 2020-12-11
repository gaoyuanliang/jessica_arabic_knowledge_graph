########jessica_dbpedia_query_ar_example.py########
from jessica_dbpedia_query import *

from jessica_neo4j import start_neo4j
from jessica_neo4j import create_neo4j_session
from jessica_neo4j import ingest_knowledge_triplets_to_neo4j

start_neo4j(http_port = "5987", bolt_port = "4522")
neo4j_session = create_neo4j_session(bolt_port = "4522")

t1 = find_related_entities(
	entity_id = "http://ar.dbpedia.org/resource/دبي",
	related_subject_num = 10,
	related_object_num = 10)

t2 = find_related_entities(
	entity_id = "http://ar.dbpedia.org/resource/مجموعة_الإمارات",
	related_subject_num = 10,
	related_object_num = 10)

t3 = find_linking_entities(
	entity_id_1 = "http://ar.dbpedia.org/resource/دبي", 
	entity_id_2 = "http://ar.dbpedia.org/resource/مجموعة_الإمارات",
	common_object_number = 5,
	common_subject_number = 5)

t4 = find_entity_pair_relation(
	entity_id_1 = "http://ar.dbpedia.org/resource/دبي", 
	entity_id_2 = "http://ar.dbpedia.org/resource/مجموعة_الإمارات",
	relation_1_to_2_number = 5,
	relation_2_to_1_number = 5)

output_triplets, entity_type_lookup, entity_name_lookup, relation_name_lookup = attach_triplet_type_and_name(t1+t2+t3+t4)

ingest_knowledge_triplets_to_neo4j(output_triplets, neo4j_session)

########jessica_dbpedia_query_ar_example.py########