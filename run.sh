#!/bin/bash

if [ -z $SERVICE_NAME ] ; then 
    echo "SERVICE_NAME env missing";
    exit 1;
fi

if [ -z $CONFIG_FOLDER ] ; then 
    echo "CONFIG_FOLDER env missing";
    exit 1;
fi

set +e

# set SERVICE_NAME in nginx config
#sed -i -e "s|\%SERVICE_NAME\%|${SERVICE_NAME}|" /etc/nginx/nginx.conf

# Get all env variables starting with APP_ and replace them in CONFIG_FILE
variables=`env | grep "^APP_"`
arr=($variables)


FILES="$CONFIG_FOLDER/*"
for i in "${arr[@]}"
do
    for f in $FILES
    do
        cp $f $f.tmp
        rm $f
        result=(${i//=/ })
        sed -e "s|##${result[0]}##|${result[1]}|g" $f.tmp > $f
        rm $f.tmp
    done
done

nginx
