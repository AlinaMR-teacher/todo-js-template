#!/bin/bash

echo "🔍 Checking Lab4 (Inheritance / AbstractComponent) ..."

ABSTRACT="src/framework/view/abstract-component.js"


if [ ! -f "$ABSTRACT" ]; then
  echo "❌ $ABSTRACT not found"
  exit 1
fi

if ! grep -q "class AbstractComponent" "$ABSTRACT"; then
  echo "❌ class AbstractComponent not found in $ABSTRACT"
  exit 1
fi


if ! grep -Eq "(throw|new\.target)" "$ABSTRACT"; then
  echo "❌ No protection against instantiating AbstractComponent (expected throw or new.target check)"
  exit 1
fi


if ! grep -q "getElement" "$ABSTRACT"; then
  echo "❌ getElement() not found in AbstractComponent"
  exit 1
fi

if ! grep -q "removeElement" "$ABSTRACT"; then
  echo "❌ removeElement() not found in AbstractComponent"
  exit 1
fi


if [ ! -d "src/view" ]; then
  echo "❌ src/view folder not found"
  exit 1
fi


COMPONENT_FILES=$(find src/view -maxdepth 1 -type f -name "*-component.js")

if [ -z "$COMPONENT_FILES" ]; then
  echo "❌ No *-component.js files found in src/view"
  exit 1
fi

echo "Found components:"
echo "$COMPONENT_FILES"


FAILED=0

for file in $COMPONENT_FILES; do
  echo ""
  echo "➡️  Checking $file ..."


  if ! grep -q "extends AbstractComponent" "$file"; then
    echo "❌ $file: does not extend AbstractComponent"
    FAILED=1
  fi


  if ! grep -Eq "from\s+['\"].*(framework/view/abstract-component\.js)['\"]" "$file"; then
    echo "❌ $file: does not import AbstractComponent from framework/view/abstract-component.js"
    FAILED=1
  fi


  if ! grep -q "getTemplate" "$file"; then
    echo "❌ $file: getTemplate() not found"
    FAILED=1
  fi
done


if [ ! -f "src/view/header-component.js" ]; then
  echo "❌ src/view/header-component.js not found"
  FAILED=1
fi

if [ "$FAILED" -ne 0 ]; then
  echo ""
  echo "❌ Lab4 failed (see errors above)"
  exit 1
fi

echo ""
echo "✅ Lab4 passed successfully!"
