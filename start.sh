#!/usr/bin/env bash
set -e

# Path from repo root to the Maven project containing pom.xml — adjust if different
PROJECT_DIR="SlaesErps (2) 2/SlaesErps (3)/SlaesErp/sales"

echo "Changing directory to: $PROJECT_DIR"
cd "$PROJECT_DIR"

echo "Building project (skipping tests)..."
mvn -DskipTests clean package

echo "Looking for built jar in target/"
JAR=$(ls target/*.jar 2>/dev/null | head -n 1)
if [ -z "$JAR" ]; then
  echo "No jar found in target/ — build may have failed." >&2
  exit 1
fi

echo "Starting jar: $JAR"
exec java -jar "$JAR"
