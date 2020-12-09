########jessica_dbpedia_query_ar_example.py########
from jessica_dbpedia_query import *

from yan_neo4j import start_neo4j
from yan_neo4j import create_neo4j_session
from yan_neo4j import ingest_knowledge_triplets_to_neo4j

start_neo4j(http_port = "5987", bolt_port = "4522")
neo4j_session = create_neo4j_session(bolt_port = "4522")

t = find_related_entities(
	entity_id = "http://ar.dbpedia.org/resource/دبي",
	related_subject_num = 4,
	related_object_num = 4)

output_triplets, entity_type_lookup, entity_name_lookup, relation_name_lookup = attach_triplet_type_and_name(t)

ingest_knowledge_triplets_to_neo4j(output_triplets, neo4j_session)
########jessica_dbpedia_query_ar_example.py########