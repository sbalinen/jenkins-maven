node {

stage('Checkout'){
     final scmVars = checkout(scm)
}
      
stage('Build EC2 Instance if required') {
     echo "${scmVars.GIT_PREVIOUS_COMMIT} ${scmVars.GIT_COMMIT}"
    }       
}
