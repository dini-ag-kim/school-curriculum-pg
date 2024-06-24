'''
Sparql query endpoint
'''
SPARQL_ENDPOINT = "https://lehrplan.yovisto.com/sparql"


'''
Suche nach allen Schulfächern, die bestimmte Wörter enthalten
'''
SCHULFACH_SUCHE = """
select distinct * where {
?s a <https://w3id.org/lehrplan/ontology/LP_00000001> .
?s rdfs:label ?label
FILTER(CONTAINS(LCASE(?label), "deutsch"))
}
"""
