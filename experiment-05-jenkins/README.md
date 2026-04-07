# Experiment 05: Introduction to Jenkins

## Aim
Install and configure Jenkins, explore dashboard, understand core concepts.

## Theory
Jenkins is an open-source automation server for CI/CD. It uses Pipelines (Jenkinsfile) to automate build, test, and deploy stages.

## Files
- `install_jenkins.yml` — Ansible playbook for Jenkins installation on Ubuntu VM

## Usage

### Install Jenkins on Ubuntu VM using Ansible
1. Ensure Ansible is installed on your control machine.
2. Update your Ansible inventory (e.g., `/etc/ansible/hosts` or a custom inventory file) with your Ubuntu VM details.
3. Run the playbook:
```bash
ansible-playbook -i your_inventory_file install_jenkins.yml
```
Replace `your_inventory_file` with your Ansible inventory file (e.g., `hosts.ini`).

### Access Jenkins
- URL: http://localhost:8080
- Get initial password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

### First-Time Setup
1. Open http://localhost:8080
2. Enter initial admin password
3. Install suggested plugins
4. Create admin user
5. Click Save and Finish

## Jenkins Concepts
- **Job/Project**: A task configuration
- **Pipeline**: Automated CI/CD workflow
- **Build**: Execution of a job
- **Stage**: Logical division in pipeline
- **Agent**: Machine that runs jobs
- **Artifact**: Output from build
