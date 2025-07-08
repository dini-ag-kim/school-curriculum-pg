# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape1-data-true.ttl --output shape1-data-true-reasoned.ttl
if python3 -m pyshacl -s shape1-Verweis.shacle shape1-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
  exit 1
fi


# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape1-data-false.ttl --output shape1-data-false-reasoned.ttl

if python3 -m pyshacl -s shape1-Verweis.shacle shape1-data-false-reasoned.ttl    
then
  echo Error
  exit 1
else
  echo Test error was as expected
fi


# --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion"

# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape2-data-true.ttl --output shape2-data-true-reasoned.ttl
if python3 -m pyshacl -s shape2-Textual-Entity.shacle shape2-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
  exit 1
fi

# --axiom-generators "SubClass ClassAssertion"

# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape2-data-false.ttl --output shape2-data-false-reasoned.ttl
if python3 -m pyshacl -s shape2-Textual-Entity.shacle shape2-data-false-reasoned.ttl
then
  echo Error
  exit 1
else
  echo Test error was as expected
fi




# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape3-data-true.ttl --output shape3-data-true-reasoned.ttl
if python3 -m pyshacl -s shape3-Bereich.shacle shape3-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
  exit 1
fi



# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape3-data-false.ttl --output shape3-data-false-reasoned.ttl
if python3 -m pyshacl -s shape3-Bereich.shacle shape3-data-false-reasoned.ttl
then
  echo Error
  exit 1
else
  echo Test error was as expected
fi



# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape4-data-true.ttl --output shape4-data-true-reasoned.ttl
if python3 -m pyshacl -s shape4-Lehrplan-Bundesland.shacle shape4-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
  exit 1
fi


# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape4-data-false.ttl --output shape4-data-false-reasoned.ttl
if python3 -m pyshacl -s shape4-Lehrplan-Bundesland.shacle shape4-data-false-reasoned.ttl
then
  echo Error
  exit 1
else
  echo Test error was as expected
fi


python3 -m pyshacl -s auto-shapes-open.ttl shape1-data-true-reasoned.ttl 
python3 -m pyshacl -s auto-shapes-open.ttl shape2-data-true-reasoned.ttl 
python3 -m pyshacl -s auto-shapes-open.ttl shape3-data-true-reasoned.ttl
python3 -m pyshacl -s auto-shapes-open.ttl shape4-data-true-reasoned.ttl




