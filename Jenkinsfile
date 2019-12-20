node {

stage('Checkout'){
     scmVars = checkout(scm)
     env.GIT_COMMIT = scmVars.GIT_COMMIT
     env.GIT_PREVIOUS_COMMIT = scmVars.GIT_PREVIOUS_COMMIT
     
}
      
stage('Build EC2 Instance if required') {
     echo "${env.GIT_PREVIOUS_COMMIT} ${env.GIT_COMMIT}"
    }       
}
