

# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner elk --input shape1-data-true.ttl --output shape1-data-true-reasoned.ttl
if python3 -m pyshacl -s shape1.shacle shape1-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
fi


# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner elk --input shape1-data-false.ttl --output shape1-data-false-reasoned.ttl

if python3 -m pyshacl -s shape1.shacle shape1-data-false-reasoned.ttl    
then
  echo Error
else
  echo Test error was as expected
fi


# --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion"

# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion" --input shape2-data-true.ttl --output shape2-data-true-reasoned.ttl
if python3 -m pyshacl -s shape2.shacle shape2-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
fi

# --axiom-generators "SubClass ClassAssertion"

# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass ClassAssertion" --input shape2-data-false.ttl --output shape2-data-false-reasoned.ttl
if python3 -m pyshacl -s shape2.shacle shape2-data-false-reasoned.ttl
then
  echo Error
else
  echo Test error was as expected
fi




# should not create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape3-data-true.ttl --output shape3-data-true-reasoned.ttl
if python3 -m pyshacl -s shape3.shacle shape3-data-true-reasoned.ttl
then
  echo Test success was as expected
else
  echo Error
fi



# should create errors
java -jar ~/robot.jar reason  --catalog catalog-v001.xml --reasoner hermit --axiom-generators "SubClass SubObjectProperty ClassAssertion PropertyAssertion InverseObjectProperties" --input shape3-data-false.ttl --output shape3-data-false-reasoned.ttl
if python3 -m pyshacl -s shape3.shacle shape3-data-false-reasoned.ttl
then
  echo Error
else
  echo Test error was as expected
fi


