#!groovy

// Build Parameters
properties([ parameters([
  string( name: 'AWS_ACCESS_KEY_ID', defaultValue: 'AKIAWI2J3LXEHXMY5TUN'),
  string( name: 'AWS_SECRET_ACCESS_KEY', defaultValue: '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')
]), pipelineTriggers([]) ])

// Environment Variables
env.AWS_ACCESS_KEY_ID = AWS_ACCESS_KEY_ID
env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY


node {
  env.PATH += ":/opt/terraform_0.7.13/"

  stage ('Checkout') {
      
    git branch: 'main',
       credentialsId: 'Github1',
       url: 'https://github.com/205118049/terraform-jenkins-pipeline.git'
       mvnHome = tool 'Maven'
  }
withCredentials([sshUserPrivateKey(
    credentialsId: 'token',
    keyFileVariable: 'SSH_KEY')])
{
    sh 'cp "$SSH_KEY" kenopsy.pem'
    sh 'terraform plan -out tfplan'
}
  { sh """               
                terraform version
                cd ${TERRAFORM_DIR}
                terraform init
                terraform plan
                terraform apply -input=false -auto-approve
            """ }
        
}