#!/usr/bin/env bash
# ==============================================================================
# Autonomous Career Suite: 1-Click Environment Setup Script
# ==============================================================================

set -e

echo "🚀 Initializing Autonomous Career Suite..."

# 1. Update Submodules
echo "📦 Updating Git Submodules..."
git submodule update --init --recursive

# 2. Setup job-discovery-inbox
echo ""
echo "⚙️ Setting up 'job-discovery-inbox'..."
cd job-discovery-inbox
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
if [ ! -f "profile.yaml" ]; then
    cp profile.example.yaml profile.yaml
    echo "   Created default profile.yaml"
fi
deactivate
cd ..

# 3. Setup notion-tracker-mcp
echo ""
echo "⚙️ Setting up 'notion-tracker-mcp'..."
cd notion-tracker-mcp
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate
cd ..

# 4. Setup overleaf-cv-agent
echo ""
echo "⚙️ Setting up 'overleaf-cv-agent'..."
cd overleaf-cv-agent
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
fi
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate
cd ..

echo ""
echo "✅ All 3 microservices have been initialized and their dependencies installed!"
echo "👉 Next steps:"
echo "   1. Copy .env.example to .env and set your Notion & Overleaf credentials."
echo "   2. Customize job-discovery-inbox/profile.yaml with your target job search criteria."
echo "   3. Register notion-tracker-mcp in your Claude Desktop or Cursor config."
