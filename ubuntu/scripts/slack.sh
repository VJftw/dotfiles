#!/bin/bash
echo ""
echo "Installing Slack"
echo ""

curl -L https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-amd64.deb -o slack-amd64.deb
sudo dpkg -i slack-amd64.deb
