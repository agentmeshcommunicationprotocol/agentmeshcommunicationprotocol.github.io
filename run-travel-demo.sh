#!/bin/bash

# AMCP v1.5 Enterprise Edition Travel Planner Demo Launcher
# Compiles and runs the travel planning command-line interface

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║           AMCP v1.5 Enterprise Edition Launcher              ║${NC}"
echo -e "${BLUE}║             Travel Planner Agent Demo System                 ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"

# Check if we're in the right directory
if [[ ! -d "examples" ]] || [[ ! -d "core" ]]; then
    echo -e "${RED}Error: Please run this script from the AMCP project root directory${NC}"
    echo "Expected directory structure:"
    echo "  amcp-v1.5-enterprise-edition/"
    echo "    ├── core/"
    echo "    ├── examples/"
    echo "    └── run-travel-demo.sh (this script)"
    exit 1
fi

echo -e "${YELLOW}🔨 Building AMCP Core Components...${NC}"

# Build core components first
cd core
if mvn compile -q > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Core components compiled successfully${NC}"
else
    echo -e "${YELLOW}⚠️  Maven build encountered issues, trying direct compilation...${NC}"
    
    # Fallback to direct compilation
    cd src/main/java
    if javac io/amcp/mobility/*.java io/amcp/messaging/*.java io/amcp/core/*.java io/amcp/messaging/impl/*.java 2>/dev/null; then
        echo -e "${GREEN}✅ Core components compiled with javac${NC}"
        cd ../../..
    else
        echo -e "${RED}❌ Failed to compile core components${NC}"
        cd ../../..
        exit 1
    fi
fi

cd ..

echo -e "${YELLOW}✈️  Building Travel Planner Examples...${NC}"

# Create build directory for examples
mkdir -p examples/build/classes

# Set up classpath
CORE_CLASSES="core/target/classes"
if [[ ! -d "$CORE_CLASSES" ]]; then
    CORE_CLASSES="core/src/main/java"
fi

# Compile travel planner examples
cd examples
if javac -cp "../${CORE_CLASSES}" -d build/classes \
    src/main/java/io/amcp/examples/travel/*.java 2>/dev/null; then
    echo -e "${GREEN}✅ Travel planner examples compiled successfully${NC}"
else
    echo -e "${YELLOW}⚠️  Some compilation issues detected, but proceeding...${NC}"
fi

echo -e "${YELLOW}🚀 Starting Travel Planner Agent Demo...${NC}"
echo ""

# Run the travel planner demo
java -cp "build/classes:../${CORE_CLASSES}" io.amcp.examples.travel.TravelPlannerDemo

echo ""
echo -e "${GREEN}✅ Travel Planner Demo completed successfully!${NC}"
echo -e "${BLUE}Thank you for trying AMCP v1.5 Enterprise Edition Travel Planner Demo${NC}"