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
    credentialsId: 'e4dd944e-5fef-4109-801c-b478d41af2d7',
    keyFileVariable: 'SSH_KEY')])
{
    sh 'cp "$SSH_KEY" files/kenopsy.pem'
    sh 'terraform plan -out tfplan'
}
  stage ('Terraform Plan') {
    sh 'terraform init'
    sh 'terraform plan -no-color -out=create.tfplan'
  }

  stage ('Terraform Apply') {
    sh 'terraform apply -no-color -auto-approve create.tfplan'
  }

  stage ('Post Run Tests') {
    echo "Insert your infrastructure test of choice and/or application validation here."
    sleep 2
    sh 'terraform show'
    sh 'cp terraform.tfstate /var/lib/jenkins/workspace/AWS-Terraform_destroy/terraform.tfstate'
  }

  stage ('Notification') {
    echo "Sent mail notification"
    mail from: "prafulwaghe100@gmail.com",
         to: "205118049@nitt.edu",
         subject: "Terraform build complete",
         body: "Jenkins job ${env.JOB_NAME} - build ${env.BUILD_NUMBER} complete"
        
  }
}