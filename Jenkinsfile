node {

stage('Checkout'){
     final scmVars = checkout(scm)
}
      
stage('Build EC2 Instance if required') {
    terraform_file_changed = sh (script: 'git diff --stat ${scmVars.GIT_PREVIOUS_COMMIT} ${scmVars.GIT_COMMIT} |grep -c terraform.tf', returnStdout: true).trim()
    if (${terraform_file_changed} == "1") {
     echo "${scmVars.GIT_PREVIOUS_COMMIT} ${scmVars.GIT_COMMIT}"
    }       
    else {
      echo "No changes to terraform file. Skipping this stage"
    }  
  }    
}
