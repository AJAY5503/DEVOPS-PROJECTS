pipeline{
 agent any 

 stages{
    stage('Checkout'){
        steps{
            git url github.com.reponame/
        }
    }

    stage('Build'){
        steps{
            sh 'docker build -t my-app .'
        }
    }

    stage('Push to Docker Hub '){

        steps{
            withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin'
                    sh 'docker tag my-app $USERNAME/my-app:latest'
                    sh 'docker push $USERNAME/my-app:latest'
            }
        }
    }
   }

}
