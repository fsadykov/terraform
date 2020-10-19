node("master") {
    withCredentials([file(credentialsId: 'common-tools-config', variable: 'FILE')]) {
       sh "cat $FILE"
    }
}