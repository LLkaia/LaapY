#!/bin/bash

path=$(pwd)
str_of_files=$(find ${path}/mongo -type f -name "*.json")
str_of_files=$(echo $str_of_files | tr ' ', ', ')

mongod --fork --syslog --bind_ip_all

sleep 5

IFS=$", " read -ra list_of_files <<< "$str_of_files"
for file in ${list_of_files[@]}; do
  name=$(basename "$file")
  name_without_ext=$(echo "$name" | cut -d'.' -f1)
  mongoimport --host=localhost --port=27017 --db=lappy --collection=$name_without_ext --file=/mongo/$name
done

#mongoimport --host=localhost --port=27017 --db=lappy --collection=specs --file=/mongo/lappy_specs.json
#
#mongoimport --host=localhost --port=27017 --db=lappy --collection=ratings --file=/mongo/lappy_ratings.json
#
#mongoimport --host=localhost --port=27017 --db=lappy --collection=search_results --file=/mongo/news.json
#
#mongoimport --host=localhost --port=27017 --db=lappy --collection=Cases --file=/mongo/Cases.json
#
#mongoimport --host=localhost --port=27017 --db=lappy --collection=Disks --file=/mongo/Disks.json
#
#mongoimport --host=localhost --port=27017 --db=lappy --collection=Headphones --file=/mongo/Headphones.json
