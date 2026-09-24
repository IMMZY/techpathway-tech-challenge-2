//----------------------------------------
// TechPathway Tech Challenge 2 - CI/CD pipeline
// GitHub -> Docker build -> ECR push -> ECS deploy
//----------------------------------------
pipeline {
    agent any

    options {
        skipDefaultCheckout()
        disableConcurrentBuilds()
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        AWS_REGION       = 'us-east-1'
        ECR_REGISTRY     = '865113568988.dkr.ecr.us-east-1.amazonaws.com'
        FRONTEND_REPO    = "${ECR_REGISTRY}/tc2-frontend"
        BACKEND_REPO     = "${ECR_REGISTRY}/tc2-backend"
        ECS_CLUSTER      = 'tc2-cluster'
        FRONTEND_SERVICE = 'tc2-frontend-service'
        BACKEND_SERVICE  = 'tc2-backend-service'
        IMAGE_TAG        = "${env.BUILD_NUMBER}"
    }

    stages {

        //----------------------------------------
        // 1. Pull the latest code from GitHub
        //----------------------------------------
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        //----------------------------------------
        // 2. Build both Docker images
        //----------------------------------------
        stage('Build images') {
            steps {
                sh '''
                    docker build -t $FRONTEND_REPO:$IMAGE_TAG -t $FRONTEND_REPO:latest ./frontend
                    docker build -t $BACKEND_REPO:$IMAGE_TAG -t $BACKEND_REPO:latest ./backend
                '''
            }
        }

        //----------------------------------------
        // 3. Log in to ECR (uses the EC2 IAM role - no stored keys)
        //----------------------------------------
        stage('Login to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                        docker login --username AWS --password-stdin $ECR_REGISTRY
                '''
            }
        }

        //----------------------------------------
        // 4. Push images (build number tag + latest)
        //----------------------------------------
        stage('Push images') {
            steps {
                sh '''
                    docker push $FRONTEND_REPO:$IMAGE_TAG
                    docker push $FRONTEND_REPO:latest
                    docker push $BACKEND_REPO:$IMAGE_TAG
                    docker push $BACKEND_REPO:latest
                '''
            }
        }

        //----------------------------------------
        // 5. Tell ECS to redeploy with the new images
        //----------------------------------------
        stage('Deploy to ECS') {
            steps {
                sh '''
                    aws ecs update-service --cluster $ECS_CLUSTER --service $BACKEND_SERVICE \
                        --force-new-deployment --region $AWS_REGION --no-cli-pager > /dev/null
                    aws ecs update-service --cluster $ECS_CLUSTER --service $FRONTEND_SERVICE \
                        --force-new-deployment --region $AWS_REGION --no-cli-pager > /dev/null
                    echo "Deployment triggered for both services"
                '''
            }
        }

        //----------------------------------------
        // 6. Wait until ECS reports the new tasks are healthy
        //----------------------------------------
        stage('Verify deployment') {
            steps {
                sh '''
                    aws ecs wait services-stable --cluster $ECS_CLUSTER \
                        --services $BACKEND_SERVICE $FRONTEND_SERVICE --region $AWS_REGION
                    echo "Both services are stable and running the new images"
                '''
            }
        }
    }

    //----------------------------------------
    // Cleanup - runs whether the build passed or failed
    //----------------------------------------
    post {
        always {
            sh 'docker logout $ECR_REGISTRY || true'
            sh 'docker image prune -f || true'
        }
        success {
            echo "Pipeline succeeded - build ${env.BUILD_NUMBER} is live"
        }
        failure {
            echo "Pipeline failed - check the stage that turned red"
        }
    }
}