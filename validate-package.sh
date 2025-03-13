#!/bin/bash

# Validate package.json in all services
find . -name "package.json" -not -path "*/node_modules/*" | while read file; do
  echo "Validating $file"
  jsonlint -q "$file" || { echo "Invalid JSON in $file"; exit 1; }
  jq -e 'has("name") and has("version") and has("main")' "$file" >/dev/null || \
    { echo "Missing required fields in $file"; exit 1; }
done
