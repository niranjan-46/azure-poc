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

# Run master setup (installs all tools)
cd experiment-12-complete
chmod +x master_setup.sh
sudo ./master_setup.sh
```

---

## Step 2: Maven - Student & Product Management

```bash
# Go to Maven project
cd experiment-02-maven

# Build the project
mvn clean package

# Run the application
java -jar target/maven-demo-app-1.0.0.jar
```

**Access:**
- Swagger UI: http://your-ip:8080/swagger-ui.html
- API Docs: http://your-ip:8080/api-docs

**Test API:**
```bash
# Get all students
curl http://localhost:8080/api/students

# Get all products
curl http://localhost:8080/api/products

# Create student
curl -X POST http://localhost:8080/api/students \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@email.com","course":"CS","age":20,"grade":"A"}'
```

---

## Step 3: Gradle - Employee & Order Management

```bash
# Go to Gradle project
cd experiment-03-gradle

# Make gradlew executable
chmod +x gradlew

# Build the project
./gradlew clean build

# Run the application
java -jar build/libs/gradle-demo-app-1.0.0.jar
```

**Access:**
- Swagger UI: http://your-ip:8080/swagger-ui.html
- API Docs: http://your-ip:8080/api-docs

**Test API:**
```bash
# Get all employees
curl http://localhost:8080/api/employees

# Get all orders
curl http://localhost:8080/api/orders

# Create employee
curl -X POST http://localhost:8080/api/employees \
  -H "Content-Type: application/json" \
  -d '{"name":"Jane Smith","email":"jane@company.com","department":"IT","salary":70000,"designation":"Developer"}'
```

---

## Step 4: Compare Build Tools

```bash
cd experiment-04-migration
chmod +x compare_builds.sh
./compare_builds.sh
```

---

## Step 5: Install Jenkins

```bash
cd experiment-05-jenkins
chmod +x install_jenkins.sh
sudo ./install_jenkins.sh
```

Access: http://localhost:8080

---

## Step 6: Jenkins CI Pipeline

Create pipeline in Jenkins UI with Jenkinsfile from `experiment-06-ci/`

---

## Step 7: Configure Ansible

```bash
cd experiment-07-ansible
ansible-playbook -i hosts.ini setup_webserver.yml
```

---

## Step 8: Jenkins + Ansible

Create pipeline with Jenkinsfile from `experiment-08-jenkins-ansible/`

---

## Step 9-11: Azure DevOps

Use YAML files from experiments 09, 10, 11

---

## Step 12: Complete Pipeline

```bash
cd experiment-12-complete
chmod +x master_setup.sh
sudo ./master_setup.sh
```

---

## Quick Reference: Commands

```bash
# === MAVEN ===
cd experiment-02-maven
mvn clean package
java -jar target/maven-demo-app-1.0.0.jar

# === GRADLE ===
cd experiment-03-gradle
chmod +x gradlew
./gradlew clean build
java -jar build/libs/gradle-demo-app-1.0.0.jar

# === AUTO SETUP ===
chmod +x auto_setup.sh
sudo ./auto_setup.sh

# === LAUNCHER ===
chmod +x devops-launcher.sh
./devops-launcher.sh
```

---

## API Endpoints Summary

### Maven Project (Student & Product)
- `/api/students` - CRUD operations
- `/api/products` - CRUD operations

### Gradle Project (Employee & Order)
- `/api/employees` - CRUD operations
- `/api/orders` - CRUD operations

---

## Access URLs

| Service | URL |
|---------|-----|
| Web App | http://localhost:8080 |
| Swagger UI | http://localhost:8080/swagger-ui.html |
| API Docs | http://localhost:8080/api-docs |
| Health | http://localhost:8080/actuator/health |

---

## Tools Covered

| Category | Tools |
|----------|-------|
| Build Tools | Maven, Gradle |
| CI/CD | Jenkins, Azure DevOps |
| Configuration Management | Ansible |
| Container | Docker |
| Web Framework | Spring Boot |
| API Documentation | Swagger UI |
