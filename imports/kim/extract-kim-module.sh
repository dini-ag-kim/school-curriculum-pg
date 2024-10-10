# Note: For consistent results run with ROBOT v1.91 or higher
#wget https://github.com/ontodev/robot/releases/download/v1.9.6/robot.jar

# Download 
wget https://raw.githubusercontent.com/dini-ag-kim/schularten/refs/heads/main/schularten.ttl
wget https://raw.githubusercontent.com/dini-ag-kim/schulfaecher/refs/heads/main/schulfaecher.ttl
wget https://raw.githubusercontent.com/dini-ag-kim/schulabschluesse/refs/heads/main/schulabschluesse.ttl

echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schularten.ttl
echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schulfaecher.ttl
echo "<> a <http://www.w3.org/2002/07/owl#Ontology> ." >>  schulabschluesse.ttl

# Extract the terms 
java -jar robot.jar merge --input schularten.ttl  --input schulfaecher.ttl  --input schulabschluesse.ttl  extract --method TOP --term 'http://www.w3.org/2004/02/skos/core#Concept'  --output kim-extracted.ttl

# Create Extracted module and annotate with new ontology information
java -jar robot.jar merge --input kim-extracted.ttl annotate --ontology-iri https://w3id.org/lehrplan/imports/kim/kim-extracted.ttl --version-iri https://w3id.org/lehrplan/imports/kim/kim-extracted.ttl --output kim-extracted.ttl

java -jar robot.jar remove --term "http://www.w3.org/2004/02/skos/core#Concept" --input kim-extracted.ttl --output kim-extracted.ttl

# Annotates the output module with a commentary to the origin of the content
java -jar robot.jar annotate --input kim-extracted.ttl --annotation rdfs:comment "This file contains externally imported content from the KIM vocabularies for Schulfächer, Schulabschlüsse, and Schularten for import into the Lehrplan Ontology (LPO)." --output kim-extracted.ttl
# Annotates each axiom with the ontology IRI, using prov:wasDerivedFrom
java -jar robot.jar annotate --input kim-extracted.ttl --annotate-derived-from true --annotate-defined-by true --output kim-extracted.ttl

rm schularten.ttl
rm schulfaecher.ttl
rm schulabschluesse.ttl
