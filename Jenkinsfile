node {

stage('Checkout'){
     scmVars = checkout(scm)
     env.GIT_COMMIT = scmVars.GIT_COMMIT
     env.GIT_PREVIOUS_COMMIT = scmVars.GIT_PREVIOUS_COMMIT
     
}
      
stage('Build EC2 Instance if required') {
   echo env.GIT_PREVIOUS_COMMIT
   echo env.GIT_COMMIT
     terraform_file_changed = bat (script: "git diff --stat ${env.GIT_PREVIOUS_COMMIT} ${env.GIT_COMMIT} |find /i 'Jenkinsfile' /c", returnStdout: true).trim()
    if (${terraform_file_changed} == "1") {
        echo "Changes to terraform file. Running this stage"
      }       

   else {
     echo "No changes to terraform file. Skipping this stage"
    }  
    }       
}
