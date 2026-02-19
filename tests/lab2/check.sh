#!/bin/bash

echo "🔍 Checking Lab2 (components) ..."


if [ ! -f "index.html" ]; then
  echo "❌ index.html not found"
  exit 1
fi

if [ ! -f "src/main.js" ]; then
  echo "❌ src/main.js not found"
  exit 1
fi


if [ ! -f "src/framework/render.js" ]; then
  echo "❌ src/framework/render.js not found"
  exit 1
fi


if ! grep -q "RenderPosition" src/framework/render.js; then
  echo "❌ RenderPosition not found in src/framework/render.js"
  exit 1
fi

if ! grep -q "function createElement" src/framework/render.js; then
  echo "❌ createElement() not found in src/framework/render.js"
  exit 1
fi

if ! grep -q "function render" src/framework/render.js; then
  echo "❌ render() not found in src/framework/render.js"
  exit 1
fi


if [ ! -d "src/view" ]; then
  echo "❌ src/view folder not found"
  exit 1
fi


if [ ! -f "src/view/header-component.js" ]; then
  echo "❌ src/view/header-component.js not found"
  exit 1
fi

if ! grep -q "class HeaderComponent" src/view/header-component.js; then
  echo "❌ class HeaderComponent not found in header-component.js"
  exit 1
fi

if ! grep -q "getTemplate" src/view/header-component.js; then
  echo "❌ getTemplate() not found in header-component.js"
  exit 1
fi

if ! grep -q "getElement" src/view/header-component.js; then
  echo "❌ getElement() not found in header-component.js"
  exit 1
fi

if ! grep -q "removeElement" src/view/header-component.js; then
  echo "❌ removeElement() not found in header-component.js"
  exit 1
fi


FORM_COUNT=$(find src/view -maxdepth 1 -type f -name "*form*component*.js" | wc -l | tr -d ' ')
BOARD_COUNT=$(find src/view -maxdepth 1 -type f -name "*board*component*.js" | wc -l | tr -d ' ')
LIST_COUNT=$(find src/view -maxdepth 1 -type f -name "*list*component*.js" | wc -l | tr -d ' ')
TASK_EXISTS=$(test -f "src/view/task-component.js" && echo 1 || echo 0)

if [ "$FORM_COUNT" -lt 1 ]; then
  echo "❌ Form component not found in src/view (expected something like *form*component*.js)"
  exit 1
fi

if [ "$BOARD_COUNT" -lt 1 ]; then
  echo "❌ Board component not found in src/view (expected something like *board*component*.js)"
  exit 1
fi

if [ "$LIST_COUNT" -lt 1 ]; then
  echo "❌ List component not found in src/view (expected something like *list*component*.js)"
  exit 1
fi

if [ "$TASK_EXISTS" -ne 1 ]; then
  echo "❌ src/view/task-component.js not found"
  exit 1
fi


if ! grep -q "HeaderComponent" src/main.js; then
  echo "❌ HeaderComponent is not used/imported in src/main.js"
  exit 1
fi

if ! grep -q "render(" src/main.js; then
  echo "❌ render(...) is not used in src/main.js"
  exit 1
fi

echo "✅ Lab2 passed successfully!"
