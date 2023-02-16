CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
REPO='student-submission'
TEST='test'

rm -rf $REPO $TEST
git clone $1 $REPO
echo 'Finished cloning'

cd $REPO

if [[ -f "ListExamples.java" ]]
then
    echo "File ListExamples.java found"
else
    echo "File ListExamples.java not found"
    exit 1
fi

cd ..
mkdir $TEST
cp -r lib $TEST
cp $REPO/ListExamples.java $TEST
cp TestListExamples.java $TEST
cd $TEST

javac -cp $CPATH *.java
echo "Compiled classes"

if [[ $? -ne 0 ]]
then
    echo "Compile error"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > results.txt
echo "Ran tests"

RESULT=`grep "^\." results.txt`
PASSED=0
FAILED=0

for (( i=0; i<${#RESULT}; i++ )); do
    if [[ "${RESULT:$i:1}" == "." ]]
    then
        ((PASSED=PASSED+1))
    else
        ((FAILED=FAILED+1))
    fi
done

echo "Total number of tests: " ${#RESULT}
echo "Number of passed tests: " $PASSED
echo "Number of failed tests: " $FAILED
echo "Score: $PASSED/${#RESULT}"