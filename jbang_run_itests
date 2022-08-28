#!/usr/bin/env bash

set -o errexit
set -o xtrace

FEATURES=${*:-*.feature}

cd ../itests/..
./gradlew clean build installDist --build-cache --scan --stacktrace

JBANG_PATH=$(realpath build/install/jbang)
export PATH=$JBANG_PATH/bin:$PATH

cd itests
./test_suite.sh || true
echo "Testing with $JBANG_PATH/bin/jbang (version: $(jbang version))"
jbang --javaagent=org.jacoco:org.jacoco.agent:0.8.8:runtime=destfile=../build/jacoco/test.exec ./karate.java -o ../build/karate $FEATURES
