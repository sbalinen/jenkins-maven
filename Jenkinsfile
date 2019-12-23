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
      }       

   else {
     echo "No changes to terraform file. Skipping this stage"
    }  
    }       
}
