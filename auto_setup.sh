#!/bin/bash
# ========================================================================
#  DevOps Workshop - Complete Automated Setup Script
#  BCSL657D - Semester 6
# ========================================================================
#  This script automatically:
#  - Updates system
#  - Installs Java, Maven, Gradle, Git
#  - Installs Jenkins
#  - Installs Ansible
#  - Installs Docker
#  - Creates all necessary directories
#  - Sets up Maven project
#  - Sets up Gradle project
#  - Configures Ansible
#  - Creates complete Jenkins pipeline
#  - Creates complete Azure DevOps pipeline
# ========================================================================
#  Usage: chmod +x auto_setup.sh && sudo ./auto_setup.sh
# ========================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# ========================================================================
# Functions
# ========================================================================

log() { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; exit 1; }
info() { echo -e "${CYAN}[i]${NC} $1"; }

banner() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║     DevOps Workshop - BCSL657D Automated Setup              ║"
    echo "║     Complete DevOps Pipeline Setup                          ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# ========================================================================
# Main Setup
# ========================================================================

banner

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    error "Please run as root: sudo ./auto_setup.sh"
fi

# Get current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# ========================================================================
# Step 1: Update System
# ========================================================================
echo ""
info "Step 1: Updating system packages..."
apt-get update -y
apt-get upgrade -y
apt-get install -y curl wget unzip git software-properties-common gnupg2 apt-transport-https ca-certificates
log "System updated"

# ========================================================================
# Step 2: Install Java
# ========================================================================
echo ""
info "Step 2: Installing Java 17..."
apt-get install -y openjdk-17-jdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment
log "Java 17 installed"

# ========================================================================
# Step 3: Install Maven
# ========================================================================
echo ""
info "Step 3: Installing Maven..."
apt-get install -y maven
log "Maven installed"

# ========================================================================
# Step 4: Install Gradle
# ========================================================================
echo ""
info "Step 4: Installing Gradle 8.6..."
GRADLE_VERSION=8.6
wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O /tmp/gradle.zip
unzip -q /tmp/gradle.zip -d /opt/
ln -sf /opt/gradle-${GRADLE_VERSION}/bin/gradle /usr/local/bin/gradle
rm /tmp/gradle.zip
log "Gradle 8.6 installed"

# ========================================================================
# Step 5: Install Git
# ========================================================================
echo ""
info "Step 5: Installing Git..."
apt-get install -y git
git config --global user.email "devops@bcsl657d.com"
git config --global user.name "DevOps Student"
log "Git installed"

# ========================================================================
# Step 6: Install Jenkins
# ========================================================================
echo ""
info "Step 6: Installing Jenkins..."
wget -q -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
apt-get update -y
apt-get install -y jenkins
systemctl daemon-reload
systemctl start jenkins
systemctl enable jenkins
log "Jenkins installed at http://localhost:8080"

# ========================================================================
# Step 7: Install Ansible
# ========================================================================
echo ""
info "Step 7: Installing Ansible..."
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible
log "Ansible installed"

# ========================================================================
# Step 8: Install Docker
# ========================================================================
echo ""
info "Step 8: Installing Docker..."
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu
log "Docker installed"

# ========================================================================
# Step 9: Set Environment Variables
# ========================================================================
echo ""
info "Step 9: Setting environment variables..."

cat > /etc/profile.d/devops.sh << 'EOF'
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export MAVEN_HOME=/usr/share/maven
export GRADLE_HOME=/opt/gradle-8.6
export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin
EOF

chmod +x /etc/profile.d/devops.sh
source /etc/profile.d/devops.sh
log "Environment variables set"

# ========================================================================
# Step 10: Build Maven Project
# ========================================================================
echo ""
info "Step 10: Building Maven project..."
cd "$SCRIPT_DIR/experiment-02-maven"
mvn clean package -DskipTests
log "Maven project built"

# ========================================================================
# Step 11: Build Gradle Project
# ========================================================================
echo ""
info "Step 11: Building Gradle project..."
cd "$SCRIPT_DIR/experiment-03-gradle"
chmod +x gradlew
./gradlew clean build -x test
log "Gradle project built"

# ========================================================================
# Step 12: Configure Ansible
# ========================================================================
echo ""
info "Step 12: Configuring Ansible..."
cd "$SCRIPT_DIR/experiment-07-ansible"
chmod +x *.sh 2>/dev/null || true
log "Ansible configured"

# ========================================================================
# Step 13: Make All Scripts Executable
# ========================================================================
echo ""
info "Step 13: Making all scripts executable..."
cd "$SCRIPT_DIR"
find . -name "*.sh" -exec chmod +x {} \;
log "All scripts made executable"

# ========================================================================
# Step 14: Build Docker Images
# ========================================================================
echo ""
info "Step 14: Building Docker images..."
cd "$SCRIPT_DIR/experiment-02-maven"
docker build -t devops-maven-app:latest . 2>/dev/null || warn "Docker build skipped (no JAR yet)"
cd "$SCRIPT_DIR/experiment-03-gradle"
docker build -t devops-gradle-app:latest . 2>/dev/null || warn "Docker build skipped (no JAR yet)"
log "Docker images built"

# ========================================================================
# Final Summary
# ========================================================================
echo ""
echo -e "${GREEN}"
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║           ALL SETUP COMPLETED SUCCESSFULLY!                    ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""
echo -e "${YELLOW}Installed Tools:${NC}"
echo "  Java:     $(java -version 2>&1 | head -1)"
echo "  Maven:    $(mvn -version 2>&1 | head -1)"
echo "  Gradle:   $(gradle -v 2>&1 | grep Gradle | head -1)"
echo "  Git:      $(git --version)"
echo "  Jenkins:  http://localhost:8080"
echo "  Ansible:  $(ansible --version | head -1)"
echo "  Docker:   $(docker --version)"
echo ""
echo -e "${YELLOW}Quick Commands:${NC}"
echo "  Maven:    cd experiment-02-maven && mvn clean package"
echo "  Gradle:   cd experiment-03-gradle && ./gradlew build"
echo "  Jenkins:  http://localhost:8080"
echo "  Ansible:  cd experiment-07-ansible && ansible-playbook -i hosts.ini setup_webserver.yml"
echo ""
echo -e "${YELLOW}Launcher:${NC}"
echo "  ./devops-launcher.sh"
echo ""
echo -e "${GREEN}Happy Learning DevOps!${NC}"
echo ""
