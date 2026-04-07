# 🚀 End-to-End CI/CD Pipeline with Jenkins (Dockerized) + Azure Container Apps

## 📌 Project Overview

This project demonstrates a **complete CI/CD pipeline** setup using:

* **Jenkins (Dockerized)**
* **Docker**
* **Azure Container Registry (ACR)**
* **Azure Container Apps**
* **GitHub Webhooks (Auto Trigger)**

The pipeline automates:

1. Building a Maven-based backend application
2. Creating a Docker image
3. Pushing the image to ACR
4. Deploying the application to Azure Container Apps

---

# 🏗️ Architecture

```
GitHub → Jenkins (Docker) → Build → Docker → ACR → Azure Container Apps
```

---

# 🐳 Jenkins Setup Using Docker

## 📦 Dockerfile

```dockerfile
FROM jenkins/jenkins:lts

USER root

# Install dependencies + Docker + Maven
RUN apt-get update && \
    apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    docker.io \
    maven && \
    apt-get clean

# Install Azure CLI
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ jammy main" > /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && \
    apt-get install -y azure-cli

# Give Jenkins access to Docker
RUN usermod -aG docker jenkins

USER jenkins
```

---

## 🔨 Build Jenkins Image

```bash
docker build -t jenkins-azure-docker .
```

---

## ▶️ Run Jenkins Container

```bash
docker run -d \
  --name jenkins \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins-azure-docker
```

---

## 🔐 Get Initial Admin Password

```bash
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```

---

## 🌐 Access Jenkins

```
http://<VM-IP>:8080
```

---

# ⚙️ Jenkins Pipeline (Jenkinsfile)

```groovy
pipeline {
    agent any

    environment {
        ACR_NAME = "jenkinspractice"
        IMAGE_NAME = "backend-app"
        RESOURCE_GROUP = "my-rg"
        CONTAINER_APP = "backend-app"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Maven') {
            steps {
                dir('experiment-02-maven') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Docker Build') {
            steps {
                dir('experiment-02-maven') {
                    sh '''
                    docker build -t $ACR_NAME.azurecr.io/$IMAGE_NAME:$BUILD_NUMBER .
                    '''
                }
            }
        }

        stage('Azure Login') {
            steps {
                withCredentials([
                    string(credentialsId: 'AZURE_CLIENT_ID', variable: 'CLIENT_ID'),
                    string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'CLIENT_SECRET'),
                    string(credentialsId: 'AZURE_TENANT_ID', variable: 'TENANT_ID')
                ]) {
                    sh '''
                    az login --service-principal \
                      -u $CLIENT_ID \
                      -p $CLIENT_SECRET \
                      --tenant $TENANT_ID
                    '''
                }
            }
        }

        stage('Push Image') {
            steps {
                sh '''
                az acr login --name $ACR_NAME
                docker push $ACR_NAME.azurecr.io/$IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }

        stage('Deploy to Azure') {
            steps {
                sh '''
                az containerapp update \
                  --name $CONTAINER_APP \
                  --resource-group $RESOURCE_GROUP \
                  --image $ACR_NAME.azurecr.io/$IMAGE_NAME:$BUILD_NUMBER
                '''
            }
        }
    }
}
```

---

# 📦 Docker Commands (Important)

## 🔨 Build Docker Image

```bash
docker build -t jenkinspractice.azurecr.io/backend-app:v1 .
```

---

## 🔐 Login to ACR

```bash
az acr login --name jenkinspractice
```

---

## 📤 Push Image to ACR

```bash
docker push jenkinspractice.azurecr.io/backend-app:v1
```

---

## 📥 Pull Image from ACR

```bash
docker pull jenkinspractice.azurecr.io/backend-app:v1
```

---

# 🔐 Azure Service Principal Setup

```bash
az ad sp create-for-rbac \
  --name jenkins-sp \
  --role contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID>
```

---

# 🔑 Jenkins Credentials

Add in Jenkins:

| Credential ID       | Type        | Value    |
| ------------------- | ----------- | -------- |
| AZURE_CLIENT_ID     | Secret Text | appId    |
| AZURE_CLIENT_SECRET | Secret Text | password |
| AZURE_TENANT_ID     | Secret Text | tenant   |

---

# 🔄 Auto Trigger (Webhook)

## 📌 GitHub Webhook URL

```
http://<VM-IP>:8080/github-webhook/
```

## Enable in Jenkins:

* ✔ GitHub hook trigger for GITScm polling

---

# 🎯 Features

* ✅ Dockerized Jenkins setup
* ✅ Automated CI/CD pipeline
* ✅ Azure Container Apps deployment
* ✅ Secure authentication using Service Principal
* ✅ GitHub webhook auto-trigger

---

# 🚀 Outcome

* Fully automated deployment pipeline
* Zero manual intervention after code push
* Production-like DevOps workflow

---

# 💡 Future Improvements

* Multi-environment deployment (Dev/Stage/Prod)
* Helm / Kubernetes integration
* Monitoring & logging
* Rollback strategy

---

# 🙌 Author

**Alpha (DevOps Engineer 🚀)**

---
