# Automated Backup Pipeline 
# 🚀 Automated Backup Pipeline

An end-to-end DevOps project that automates file backups using Docker and Jenkins while monitoring the backup process with Prometheus and Grafana.

---

## 📌 Project Overview

This project demonstrates how to build an automated backup pipeline using modern DevOps tools.

The pipeline automatically:

- Creates backups
- Verifies backup integrity using SHA-256 checksum
- Exports backup metrics
- Monitors backups in Prometheus
- Visualizes metrics in Grafana
- Sends email notifications from Jenkins

---

# 🏗️ Architecture

```
                GitHub Repository
                        │
                        ▼
                Jenkins Pipeline
                        │
                        ▼
          Docker Backup Container
                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
 Backup Files      SHA256 Checksum    Metrics File
                                           │
                                           ▼
                                  Metrics Exporter
                                           │
                                           ▼
                                     Prometheus
                                           │
                                           ▼
                                       Grafana
```

---

# ✨ Features

- ✅ Automated Backup Creation
- ✅ Dockerized Backup Script
- ✅ Jenkins Pipeline Automation
- ✅ SHA-256 Backup Verification
- ✅ Prometheus Monitoring
- ✅ Grafana Dashboard
- ✅ Email Notifications
- ✅ GitHub Integration
- ✅ Scheduled Execution

---

# 🛠️ Technologies Used

- Docker
- Docker Compose
- Jenkins
- Prometheus
- Grafana
- Bash
- Git
- GitHub

---

# 📂 Project Structure

```
Automated-Backup-Pipeline
│
├── backup-script/
│   └── backup.sh
│
├── backups/
│
├── metrics-exporter/
│
├── prometheus/
│
├── sample-data/
│
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── prometheus.yml
└── README.md
```

---

# ⚙️ Pipeline Workflow

1. Jenkins pulls the latest code from GitHub.
2. Docker builds the backup image.
3. Backup container creates a compressed backup.
4. SHA-256 checksum is generated.
5. Backup integrity is verified.
6. Metrics are exported.
7. Prometheus collects the metrics.
8. Grafana displays live monitoring dashboards.
9. Jenkins sends an email notification.

---

# 📊 Monitoring Metrics

The following metrics are monitored:

- Backup Size
- Backup Status
- Backup Timestamp
- Backup File Count
- Time Since Last Backup

---

# 📈 Grafana Dashboard

The Grafana dashboard includes:

- Backup Size Trend
- Last Backup Time
- Time Since Last Backup
- Backup Files Count

---

# 🔐 Backup Integrity Verification

Each backup generates a SHA-256 checksum.

Example:

```
backup.tar.gz
backup.tar.gz.sha256
```

Verification command:

```
sha256sum -c backup.tar.gz.sha256
```

Expected Output:

```
backup.tar.gz: OK
```

---

# 📧 Email Notifications

Jenkins automatically sends email notifications after every pipeline execution.

- ✅ Success Notification
- ❌ Failure Notification

---

# ▶️ Running the Project

Clone the repository

```bash
git clone https://github.com/addam28/Backup-pipeline.git
```

Start the monitoring stack

```bash
docker compose up -d
```

Start Jenkins

```bash
docker start jenkins-docker
```

Open:

- Jenkins → http://localhost:8081
- Grafana → http://localhost:3000
- Prometheus → http://localhost:9090

Run the Jenkins Pipeline.

---

# 📷 Project Screenshots

(Add screenshots here)

- Jenkins Successful Build
- Grafana Dashboard
- Prometheus Targets
- Docker Containers

---

# 🚀 Future Enhancements

- Restore Pipeline
- Backup Retention Policy
- Cloud Storage Integration
- Slack Notifications
- Kubernetes Deployment

---

# 👨‍💻 Author

**Adarsh Damele**

B.Tech Computer Science Engineering

Lovely Professional University

GitHub:
https://github.com/addam28