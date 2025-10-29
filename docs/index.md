# Documentation of German Curricula Ontology

Welcome to the documentation page for our ontology of German curricula.


```d2
direction: up

classes: {
  bfoclazz: {
    style: {
      fill: "#dd42f5"
      shadow: true
      border-radius: 5
      font-color: white
    }
  }

  iaoclazz: {
    style: {
      fill: "#dd2f45"
      shadow: true
      border-radius: 5
      font-color: white
    }
  }

  lpcclazz: {
    style: {
      fill: "#4d59df"
      shadow: true
      border-radius: 5
      font-color: white
    }
  }

  lpbclazz: {
    style: {
      fill: "#54dfd2"
      shadow: true
      border-radius: 5
      font-color: white
    }
  }

  individual: {
    style: {
      fill: "lightgrey"
    }
  }
}
tbox.bfo*.class: bfoclazz
tbox.iao*.class: iaoclazz
tbox.lpc*.class: lpcclazz
tbox.lpb*.class: lpbclazz
tbox.label: "Ontology (t-box)"
tbox: {
  "lpc:CE-Lehrplan" -> "iao:information content entity": "rdfs:subClassOf"
  "lpc:CE-Bereich" -> "iao:information content entity": "rdfs:subClassOf"
  "lpc:Bundeslandbezeichnung" -> "iao:information content entity": "rdfs:subClassOf"
  "lpc:Schulfach" -> "iao:information content entity": "rdfs:subClassOf"
  "lpb:Lehrplan (BY)" -> "lpc:CE-Lehrplan": "rdfs:subClassOf"
  "lpb:Lernbereich (BY)" -> "lpc:CE-Bereich": "rdfs:subClassOf"
}

# tbox.style.stroke: transparent
# tbox.style.fill: transparent

abox.ex*.class: individual
abox.label: "Data (a-box)"
# abox.label: "___________________________________________________________________________"
abox: {
  "ex:lehrplan1" -> "lpc:Bayern": "lpc:von bundesland"
  "ex:bereich1" -> "lpb:Mathematik": "lpc:hat schulfach"
  "ex:lehrplan1" -> "ex:bereich1": "ro:has part"
}

# abox.style.stroke: transparent
# abox.style.fill: transparent

abox."ex:lehrplan1" -> tbox."lpb:Lehrplan (BY)": "rdf:type"
abox."lpc:Bayern" -> tbox."lpc:Bundeslandbezeichnung": "rdf:type"
abox."ex:bereich1" -> tbox."lpb:Lernbereich (BY)": "rdf:type"
abox."lpb:Mathematik" -> tbox."lpc:Schulfach": "rdf:type"


```