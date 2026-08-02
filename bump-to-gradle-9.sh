#!/bin/bash

# Script to bump Gradle version to 9.6.1

# Check if the gradle-wrapper.properties file exists
if [ ! -f "gradle/wrapper/gradle-wrapper.properties" ]; then
    echo "Error: gradle/wrapper/gradle-wrapper.properties not found!"
    exit 1
fi

# Update the distributionUrl to use Gradle 9.6.1
sed -i 's|distributionUrl=.*|distributionUrl=https\://services.gradle.org/distributions/gradle-9.6.1-bin.zip|' gradle/wrapper/gradle-wrapper.properties

# Verify the change
echo "Updated gradle-wrapper.properties:"
grep "distributionUrl" gradle/wrapper/gradle-wrapper.properties

# Run Gradle wrapper to update the wrapper JAR
./gradlew wrapper --gradle-version 9.6.1

# Verify the Gradle version
echo "Gradle version updated to:"
./gradlew --version | grep "Gradle"

echo "Gradle version bumped to 9.6.1 successfully!"
