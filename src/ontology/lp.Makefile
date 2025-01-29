## Customize Makefile settings for lp
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

.PRECIOUS: $(IMPORTDIR)/%_import.owl


$(IMPORTDIR)/iao_import.owl: $(MIRRORDIR)/iao.owl $(IMPORTDIR)/iao_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/iao_terms.txt --force true --copy-ontology-annotations true --individuals exclude --method BOT \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
 		remove --term http://www.w3.org/2002/07/owl#Nothing  --term http://purl.obolibrary.org/obo/PATO_0000001\
 		remove --select "RO:*"  \
		$(ANNOTATE_CONVERT_FILE); fi


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




