#!/usr/bin/env bash 

url=""

url_check(){ 
  
  status_code=$(curl --output /dev/null --silent --head --write-out '%{http_code}\n' $url)

  if [ $status_code -ne "200" ] ; then 
    printf "%s\\n" "BAD URL" 
  else 
    printf "%s\\n" "GOOD URL" 
fi 
}

url_check
