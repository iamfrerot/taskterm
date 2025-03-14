#!/bin/bash

set -e  # Exit on error

PACKAGE_NAME="taskterm"

# Check if package.json exists
if [ ! -f "package.json" ]; then
  echo "❌ Error: package.json not found"
  exit 1
fi

echo "🚀 Incrementing patch version for $PACKAGE_NAME..."
npm version patch

echo "📦 Publishing $PACKAGE_NAME to npm..."
# Add --no-interactive flag to prevent prompts
npm publish --registry=https://registry.npmjs.org --no-interactive

echo "✅ Publish complete!"
# Force kill any potential hanging npm processes
pkill -f npm || true
exit 0
