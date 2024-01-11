#!/bin/bash

mongod --fork --syslog --bind_ip_all

sleep 5

mongoimport --host=localhost --port=27017 --db=lappy --collection=specs --file=/mongo/lappy_specs.json

mongoimport --host=localhost --port=27017 --db=lappy --collection=ratings --file=/mongo/lappy_ratings.json

mongoimport --host=localhost --port=27017 --db=lappy --collection=search_results --file=/mongo/news.json

mongoimport --host=localhost --port=27017 --db=lappy --collection=Cases --file=/mongo/Cases.json

mongoimport --host=localhost --port=27017 --db=lappy --collection=Disks --file=/mongo/Disks.json

mongoimport --host=localhost --port=27017 --db=lappy --collection=Headphones --file=/mongo/Headphones.json
