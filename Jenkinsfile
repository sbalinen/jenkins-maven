node {
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10'))])
stage('Checkout'){
     scmVars = checkout(scm)
     env.GIT_COMMIT = scmVars.GIT_COMMIT
     env.GIT_PREVIOUS_COMMIT = scmVars.GIT_PREVIOUS_COMMIT    
}
  	
	
stage('Build EC2 Instance if required') {
     terraform_file_changed = bat (script: "git diff --name-only ${env.GIT_PREVIOUS_COMMIT} ${env.GIT_COMMIT}", returnStdout: true).trim()
    if (terraform_file_changed.contains("Jenkinsfile")) {
        echo "Running Stage"
	bat 'C:/Users/sbalineni/Downloads/terraform init -input=false'
        bat 'C:/Users/sbalineni/Downloads/terraform apply -input=false -auto-approve'    	    
      }       
   else {
     echo "No changes to terraform file. Skipping this stage"
    }  
    withCredentials([sshUserPrivateKey(credentialsId: "ec2-instances", keyFileVariable: 'SSH_ID_RSA')]) {
		env.PUBLIC_DNS  = bat (script: "@C:/Users/sbalineni/Downloads/terraform output PUBLIC_DNS_NAME", returnStdout: true).trim()		
	    	bat "ssh -i $SSH_ID_RSA -l ec2-user ${env.PUBLIC_DNS} sudo yum install -y docker;sudo service start docker"
	} 
    }       
}
