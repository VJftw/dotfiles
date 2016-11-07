#!/bin/bash

echo ""
echo "Installing JetBrains IntelliJ IDEA Ultimate"
echo ""
curl -L https://download.jetbrains.com/idea/ideaIU-2016.2.5.tar.gz -o ideaIU.tar.gz
tar -xvzf ideaIU.tar.gz

mkdir -p ~/JetBrains
mv idea-IU-* ~/JetBrains/IDEAUltimate
