pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/addam28/Backup-pipeline.git'
            }
        }

        stage('Build Backup Image') {
            steps {
                sh 'docker build -t backup-pipeline-image .'
            }
        }

        stage('Run Backup') {
            steps {
                sh '''
                docker create --name temp-backup-container backup-pipeline-image
                docker start -a temp-backup-container
                docker cp temp-backup-container:/data/backups/. ./backups
                docker rm temp-backup-container
                LATEST_BACKUP=$(ls -t backups/*.tar.gz | head -n 1)
echo "SIMULATING CORRUPTION FOR TESTING" >> "$LATEST_BACKUP"
                '''
            }
        }

        stage('Verify Backup Integrity') {
            steps {
                sh '''
                cd backups
                LATEST_BACKUP=$(ls -t *.tar.gz | head -n 1)
                echo "Verifying: $LATEST_BACKUP"
                sha256sum -c "$LATEST_BACKUP.sha256"
                '''
            }
        }

        stage('Verify Backup') {
            steps {
                sh 'ls -la ./backups'
            }
        }
    }

    post {

        success {
            mail(
                to: 'dameleadarsh@gmail.com',
                subject: "SUCCESS: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
Hello Adarsh,

Your Backup Pipeline completed successfully.

Job Name: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Status: SUCCESS

Build URL:
${env.BUILD_URL}

Regards,
Jenkins
"""
            )
        }

        failure {
            mail(
                to: 'dameleadarsh@gmail.com',
                subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                body: """
Hello Adarsh,

Your Backup Pipeline has failed.

Job Name: ${env.JOB_NAME}
Build Number: ${env.BUILD_NUMBER}
Status: FAILURE

Check the build logs:
${env.BUILD_URL}

Regards,
Jenkins
"""
            )
        }
    }
}