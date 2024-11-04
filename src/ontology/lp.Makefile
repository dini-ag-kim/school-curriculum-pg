## Customize Makefile settings for lp
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


CITATION="'Lehrplan Ontology. Version $(VERSION), https://w3id.org/lehrplan/ontology'"



ALL_ANNOTATIONS=--annotate-defined-by true \
	--ontology-iri https://w3id.org/lehrplan/ontology/ -V https://w3id.org/lehrplan/ontology/$(VERSION) \
	--annotation http://purl.org/dc/terms/created "$(TODAY)" \
	--annotation http://purl.org/dc/terms/bibliographicCitation "$(CITATION)"  \
#	--link-annotation owl:priorVersion https://w3id.org/lehrplan/ontology/$(PRIOR_VERSION) \

update-ontology-annotations: 
	$(ROBOT) annotate --input ../../lp.owl $(ALL_ANNOTATIONS) --output ../../lp.owl && \
	$(ROBOT) annotate --input ../../lp.ttl $(ALL_ANNOTATIONS) --output ../../lp.ttl && \
	$(ROBOT) annotate --input ../../lp-simple.owl $(ALL_ANNOTATIONS) --output ../../lp-simple.owl && \
	$(ROBOT) annotate --input ../../lp-simple.ttl $(ALL_ANNOTATIONS) --output ../../lp-simple.ttl && \
	$(ROBOT) annotate --input ../../lp-full.owl $(ALL_ANNOTATIONS) --output ../../lp-full.owl && \
	$(ROBOT) annotate --input ../../lp-full.ttl $(ALL_ANNOTATIONS) --output ../../lp-full.ttl && \
	$(ROBOT) annotate --input ../../lp-base.owl $(ALL_ANNOTATIONS) --output ../../lp-base.owl && \
	$(ROBOT) annotate --input ../../lp-base.ttl $(ALL_ANNOTATIONS) --output ../../lp-base.ttl 




