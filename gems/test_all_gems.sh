#!/bin/bash
result=0

for test_script in $(find . -name test.sh); do
  pushd `dirname $test_script` > /dev/null
  echo "################ $(basename `dirname $test_script`) ################"
  ./test.sh
  let gem_result=$?
  let result=result+gem_result
  if [ $gem_result -eq 0 ]; then
      echo "GEM SUCCESS"
  else
      echo "GEM FAILURE"
  fi
  popd > /dev/null
done

echo "################ RESULT FOR ALL GEMS ################"
if [ $result -eq 0 ]; then
	echo "SUCCESS"
else
	echo "FAILURE"
fi

exit $result
