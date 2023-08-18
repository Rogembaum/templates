def build.number = 151
String getTag(String version){

}


//def imageTag = getTag(version())


//setParam('app_version', imageTag)
setParam('app_version', build.number)