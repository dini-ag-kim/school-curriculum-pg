

VERSION=1.0.0-6
PRIOR_VERSION=1.0.0-5
ONTBASE=https://w3id.org/lehrplan/ontology/
ANNOTATE_ONTOLOGY_VERSION="annotate -V $ONTBASE/$VERSION/\$@ --annotation owl:versionInfo $VERSION"

sh run.sh make clean

sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE ANNOTATE_ONTOLOGY_VERSION="$ANNOTATE_ONTOLOGY_VERSION" prepare_release

sh run.sh make release-land-BB
sh run.sh make release-land-BE
sh run.sh make release-land-BW
sh run.sh make release-land-BY
sh run.sh make release-land-HB
sh run.sh make release-land-HE
sh run.sh make release-land-HH
sh run.sh make release-land-MV
sh run.sh make release-land-NI
sh run.sh make release-land-NW
sh run.sh make release-land-RP
sh run.sh make release-land-SH
sh run.sh make release-land-SL
sh run.sh make release-land-SN
sh run.sh make release-land-ST
sh run.sh make release-land-TH
sh run.sh make lp-ohne-land.owl

#sh run.sh make VERSION=$VERSION PRIOR_VERSION=$PRIOR_VERSION update-ontology-annotations
sh run.sh make VERSION=$VERSION  update-ontology-annotations

# finally refresh imports again, so that version IRIs are updated back to "normal". 
#sh run.sh make no-mirror-refresh-imports


## generate the shacl shapes from the ontology
sh utils/generate-auto-shapes.sh
