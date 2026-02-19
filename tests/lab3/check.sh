#!/bin/bash

echo "🔍 Checking Lab3 (Model / Data structure) ..."


if [ ! -d "src/model" ]; then
  echo "❌ src/model folder not found"
  exit 1
fi


if [ ! -f "src/model/tasks-model.js" ]; then
  echo "❌ src/model/tasks-model.js not found"
  exit 1
fi


if ! grep -q "class TasksModel" src/model/tasks-model.js; then
  echo "❌ class TasksModel not found in src/model/tasks-model.js"
  exit 1
fi


if ! grep -q "getTasks" src/model/tasks-model.js; then
  echo "❌ getTasks() not found in src/model/tasks-model.js"
  exit 1
fi


if ! grep -Eq "(tasks\s*=\s*\[|#tasks\s*=\s*\[|_tasks\s*=\s*\[|this\.tasks\s*=)" src/model/tasks-model.js; then
  echo "❌ tasks array storage not found (expected tasks = [] / #tasks = [] / _tasks = [] / this.tasks = ...)"
  exit 1
fi


if ! grep -q "id" src/model/tasks-model.js; then
  echo "❌ field 'id' not found in tasks-model.js"
  exit 1
fi

if ! grep -q "title" src/model/tasks-model.js; then
  echo "❌ field 'title' not found in tasks-model.js"
  exit 1
fi

if ! grep -q "status" src/model/tasks-model.js; then
  echo "❌ field 'status' not found in tasks-model.js"
  exit 1
fi


echo "✅ Lab3 passed successfully!"
