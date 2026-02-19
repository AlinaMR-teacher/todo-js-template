#!/bin/bash

echo "🔍 Checking Lab1 structure..."


if [ ! -f "index.html" ]; then
  echo "❌ index.html not found"
  exit 1
fi


if [ ! -f "css/style.css" ]; then
  echo "❌ css/style.css not found"
  exit 1
fi


if [ ! -f "src/main.js" ]; then
  echo "❌ src/main.js not found"
  exit 1
fi


if ! grep -q "src/main.js" index.html; then
  echo "❌ main.js is not connected in index.html"
  exit 1
fi



if [ ! -s "css/style.css" ]; then
  echo "❌ style.css is empty"
  exit 1
fi

echo "✅ Lab1 passed successfully!"
