#!/bin/bash
# install_jenkins.sh — Install Jenkins on Ubuntu/Debian
# Usage: chmod +x install_jenkins.sh && sudo ./install_jenkins.sh
set -e

RED='\033[0;31m'; GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[0;33m'; NC='\033[0m'

log() { echo -e "${GREEN}[JENKINS]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

echo -e "${BLUE}"
echo '=========================================='
echo '  Installing Jenkins'
echo '=========================================='
echo -e "${NC}"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    err "Please run as root: sudo ./install_jenkins.sh"
fi

# Install dependencies
log "Installing dependencies..."
apt-get update -y
apt-get install -y wget gnupg2 apt-transport-https

# Add Jenkins GPG key
log "Adding Jenkins repository..."
wget -q -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

# Install Jenkins
log "Installing Jenkins..."
apt-get update -y || {
    warn "APT update failed, trying alternative method..."
    wget -q https://pkg.jenkins.io/debian-stable/jenkins_2.455_all.deb -O /tmp/jenkins.deb
    dpkg -i /tmp/jenkins.deb || apt-get install -f -y
}
apt-get install -y jenkins || {
    warn "Jenkins install failed, retrying..."
    wget -q https://pkg.jenkins.io/debian-stable/jenkins_2.455_all.deb -O /tmp/jenkins.deb
    dpkg -i /tmp/jenkins.deb
    apt-get install -f -y
}

# Start and enable Jenkins
log "Starting Jenkins service..."
systemctl daemon-reload
systemctl start jenkins
systemctl enable jenkins

# Wait for Jenkins to start
log "Waiting for Jenkins to start..."
sleep 10

echo ''
echo -e "${GREEN}"
echo '=========================================='
echo '  Jenkins installed successfully!'
echo '=========================================='
echo "URL: http://localhost:8080"
echo ''
echo 'Initial admin password:'
cat /var/lib/jenkins/secrets/initialAdminPassword
echo -e "${NC}"
echo ''
log "For first-time setup, follow the wizard at http://localhost:8080"
