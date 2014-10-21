#!/bin/bash

variables=`env | grep APP_`
arr=($variables)

for i in "${arr[@]}"
do
    cp $CONFIG_FILE $CONFIG_FILE.tmp
    rm $CONFIG_FILE
    result=(${i//=/ })
    sed -e "s|##${result[0]}##|${result[1]}|g" $CONFIG_FILE.tmp > $CONFIG_FILE
    rm $CONFIG_FILE.tmp
done

nginx
