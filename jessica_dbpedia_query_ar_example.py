from jessica_dbpedia_query import *

input_triplets = [
{'object': 'http://ar.dbpedia.org/resource/دبي', 'relation': 'http://dbpedia.org/ontology/deathPlace', 'subject': 'http://ar.dbpedia.org/resource/عبد_الرحمن_بن_حافظ'},
{'object': 'http://ar.dbpedia.org/resource/دبي', 'relation': 'http://dbpedia.org/ontology/deathPlace', 'subject': 'http://ar.dbpedia.org/resource/عبد_الرحمن_بن_حافظ'},
{'object': 'http://ar.dbpedia.org/resource/دبي', 'relation': 'http://dbpedia.org/ontology/deathPlace', 'subject': 'http://ar.dbpedia.org/resource/عبد_الرحمن_بن_حافظ'},
{'object': 'http://ar.dbpedia.org/resource/دبي', 'relation': 'http://dbpedia.org/ontology/birthPlace', 'subject': 'http://ar.dbpedia.org/resource/عبد_الرحمن_بن_حافظ'},
]

output_triplets, entity_type_lookup, entity_name_lookup, relation_name_lookup = attach_triplet_type_and_name(input_triplets)

for t in output_triplets:
	print(t)

###

from yan_neo4j import start_neo4j
from yan_neo4j import create_neo4j_session
from yan_neo4j import ingest_knowledge_triplets_to_neo4j

start_neo4j(http_port = "5987", bolt_port = "4522")
neo4j_session = create_neo4j_session(bolt_port = "4522")

ingest_knowledge_triplets_to_neo4j(output_triplets, neo4j_session)



t = find_related_entities(
	entity_id = "http://ar.dbpedia.org/resource/دبي",
	related_subject_num = 4,
	related_object_num = 4)

output_triplets, entity_type_lookup, entity_name_lookup, relation_name_lookup = attach_triplet_type_and_name(t)


ingest_knowledge_triplets_to_neo4j(output_triplets, neo4j_session)
