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
if ! npm publish --registry=https://registry.npmjs.org; then
  echo "❌ Error: npm publish failed"
  exit 1
fi

echo "✅ Publish complete!"
exit 0  # Explicitly exit after successful publication
