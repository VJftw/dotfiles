echo ""
echo "Installing Atom"
echo ""
curl -L https://atom.io/download/deb -o atom-amd64.deb
sudo dpkg -i atom-amd64.deb
apm install sync-settings
