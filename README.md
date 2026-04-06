# DevOps Workshop - BCSL657D

Complete Teaching Manual | Semester 6 | Credits: 01

---

# Step-by-Step Guide

Follow these steps in order to complete all 12 experiments.

---

## Step 1: Update System & Install Tools

```bash
# Update Ubuntu system
sudo apt update && sudo apt upgrade -y

# Go to experiment-01
cd experiment-01-intro

# Make script executable
chmod +x install_devtools.sh

# Run installation script (installs Java, Maven, Gradle, Git)
sudo ./install_devtools.sh

# Verify installations
java -version
mvn -version
gradle -version
git --version
```

---

## Step 2: Build with Maven

```bash
# Go to Maven project
cd ../experiment-02-maven

# Build the project
mvn clean package

# Run the application
java -jar target/devops-maven-app-1.0-SNAPSHOT.jar

# Run tests
mvn test
```

---

## Step 3: Build with Gradle

```bash
# Go to Gradle project
cd ../experiment-03-gradle

# Make gradlew executable
chmod +x gradlew

# Build the project
./gradlew clean build

# Run the application
./gradlew run

# Run tests
./gradlew test

# Try custom task
./gradlew hello
```

---

## Step 4: Compare Maven vs Gradle

```bash
# Go to migration experiment
cd ../experiment-04-migration

# Make script executable
chmod +x compare_builds.sh

# Compare build times
./compare_builds.sh
```

---

## Step 5: Install Jenkins

```bash
# Go to Jenkins experiment
cd ../experiment-05-jenkins

# Make script executable
chmod +x install_jenkins.sh

# Run installation script
sudo ./install_jenkins.sh
```

**After installation:**
- Open browser: http://localhost:8080
- Get password: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
- Complete setup wizard

---

## Step 6: Create Jenkins CI Pipeline

```bash
# The Jenkinsfile is in experiment-06-ci
cd ../experiment-06-ci

# View the Jenkinsfile
cat Jenkinsfile
```

**In Jenkins UI:**
1. Dashboard → New Item
2. Enter name: `DevOps-CI`
3. Select: Pipeline
4. Definition: Pipeline script from SCM
5. SCM: Git
6. Repository URL: (your repo URL)
7. Script Path: `experiment-06-ci/Jenkinsfile`
8. Save → Build Now

---

## Step 7: Configure Ansible

```bash
# Go to Ansible experiment
cd ../experiment-07-ansible

# Test Ansible connectivity (local)
ansible all -i hosts.ini -m ping

# Check playbook syntax
ansible-playbook -i hosts.ini setup_webserver.yml --syntax-check

# Run webserver playbook (dry-run)
ansible-playbook -i hosts.ini setup_webserver.yml --check

# Run webserver playbook (actual)
ansible-playbook -i hosts.ini setup_webserver.yml -v
```

**Install DevOps tools with Ansible:**
```bash
# Run all playbooks
ansible-playbook -i hosts.ini playbooks/main.yml
```

---

## Step 8: Jenkins + Ansible Deployment

```bash
# The Jenkinsfile is in experiment-08-jenkins-ansible
cd ../experiment-08-jenkins-ansible

# View the Jenkinsfile
cat Jenkinsfile
```

**In Jenkins UI:**
1. Create new Pipeline job
2. Script Path: `experiment-08-jenkins-ansible/Jenkinsfile`
3. Build Now

---

## Step 9: Azure DevOps - Basic Pipeline

```bash
# Go to Azure DevOps experiment
cd ../experiment-09-azure-devops

# View the pipeline
cat azure-pipelines.yml
```

**In Azure DevOps Portal:**
1. Go to https://dev.azure.com
2. Create Organization → Project
3. Pipelines → New Pipeline
4. Select: Azure Repos Git
5. Select: Existing YAML file
6. Path: `experiment-09-azure-devops/azure-pipelines.yml`
7. Run Pipeline

---

## Step 10: Azure DevOps - Gradle Pipeline

```bash
# Go to build pipeline experiment
cd ../experiment-10-build-pipeline

# View the pipeline
cat azure-pipelines-gradle.yml
```

**In Azure DevOps:**
1. Pipelines → New Pipeline
2. Select: `experiment-10-build-pipeline/azure-pipelines-gradle.yml`
3. Run Pipeline

---

## Step 11: Azure DevOps - Release Pipeline

```bash
# Go to release pipeline experiment
cd ../experiment-11-release-pipeline

# View the pipeline
cat azure-pipelines-cd.yml
```

**In Azure DevOps:**
1. Pipelines → New Pipeline
2. Select: `experiment-11-release-pipeline/azure-pipelines-cd.yml`
3. Configure Azure subscription
4. Run Pipeline

---

## Step 12: Complete DevOps Pipeline

```bash
# Go to complete pipeline experiment
cd ../experiment-12-complete

# Run master setup (installs all tools)
chmod +x master_setup.sh
sudo ./master_setup.sh
```

**Create Complete Pipeline:**

1. **Jenkins:**
   - New Item → Pipeline
   - Script Path: `experiment-12-complete/Jenkinsfile`
   - Build Now

2. **Azure DevOps:**
   - Pipelines → New Pipeline
   - Select: `experiment-12-complete/azure-pipelines-complete.yml`
   - Run Pipeline

---

## Quick Reference: All Commands

```bash
# === SETUP ===
sudo apt update && sudo apt upgrade -y
cd experiment-12-complete && sudo ./master_setup.sh

# === MAVEN ===
cd experiment-02-maven
mvn clean package
java -jar target/devops-maven-app-1.0-SNAPSHOT.jar

# === GRADLE ===
cd experiment-03-gradle
chmod +x gradlew
./gradlew clean build
./gradlew run

# === JENKINS ===
sudo systemctl status jenkins
http://localhost:8080

# === ANSIBLE ===
cd experiment-07-ansible
ansible all -i hosts.ini -m ping
ansible-playbook -i hosts.ini setup_webserver.yml

# === DOCKER ===
cd experiment-02-maven
docker build -t devops-maven-app:latest .
docker run -p 8080:8080 devops-maven-app:latest

# === LAUNCHER ===
chmod +x devops-launcher.sh
./devops-launcher.sh
```

---

## Interactive Launcher (Easiest Way)

Instead of remembering commands, use the interactive launcher:

```bash
chmod +x devops-launcher.sh
./devops-launcher.sh
```

This provides a menu to:
- Run Maven commands
- Run Gradle commands
- Check Jenkins status
- Run Ansible playbooks
- View Azure pipelines
- Check Docker
- Show all tool versions

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Java not found | Run: `source /etc/profile.d/devops.sh` |
| Maven not found | `sudo apt install maven` |
| Gradle not found | Check: `gradle --version` |
| Jenkins won't start | `sudo systemctl restart jenkins` |
| Ansible ping fails | Check hosts.ini inventory |
| Azure pipeline fails | Check Azure subscription |
