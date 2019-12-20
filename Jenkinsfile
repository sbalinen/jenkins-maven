node {

stage('Checkout'){
     scmVars = checkout(scm)
     env.GIT_COMMIT = scmVars.GIT_COMMIT
     env.GIT_PREVIOUS_COMMIT = scmVars.GIT_PREVIOUS_COMMIT
     
}
      
stage('Build EC2 Instance if required') {
   echo env.GIT_PREVIOUS_COMMIT
   echo env.GIT_COMMIT
     terraform_file_changed = bat (script: "git diff --name-only ${env.GIT_PREVIOUS_COMMIT} ${env.GIT_COMMIT}", returnStdout: true).trim()
    //if (${terraform_file_changed} == "1") {
        echo "$terraform_file_changed"
      //}       

   //else {
     //echo "No changes to terraform file. Skipping this stage"
    //}  
    }       
}
