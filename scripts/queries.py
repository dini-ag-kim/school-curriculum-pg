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

'''
Suche nach allen Unterelementen, die mit einem bestimmten Lehrplanelement verbunden sind
<https://w3id.org/lehrplan/ontology/LP_00000008>: hat_teil
<https://lehrplan.yovisto.com/resource/lp/rp/c688300f-1c49-11ef-8398-d9ff35fc6bd6>: Beispiel Resource
'''
KOMPETENZ_BAUM_SUCHE = """
SELECT distinct ?root_label ?level_1_label ?level_2_label ?level_3_label
WHERE {
  <https://lehrplan.yovisto.com/resource/lp/rp/c688300f-1c49-11ef-8398-d9ff35fc6bd6> <https://w3id.org/lehrplan/ontology/LP_00000008> ?level_1 .
?level_1 rdfs:label ?level_1_label .
  OPTIONAL {
    ?level_1 <https://w3id.org/lehrplan/ontology/LP_00000008> ?level_2 .
?level_2 rdfs:label ?level_2_label .
    OPTIONAL {
      ?level_2 <https://w3id.org/lehrplan/ontology/LP_00000008> ?level_3 .
?level_3 rdfs:label ?level_3_label .
    }
  }
BIND(<https://lehrplan.yovisto.com/resource/lp/rp/c688300f-1c49-11ef-8398-d9ff35fc6bd6> as ?root) .
?root rdfs:label ?root_label
}
ORDER BY ?root ?level_1 ?level_2 ?level_3
"""

