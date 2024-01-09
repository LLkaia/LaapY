#!/bin/bash

mongod --fork --syslog --bind_ip_all

sleep 5

mongoimport --host=localhost --port=27017 --db=lappy --collection=specs --file=/mongo/lappy_specs.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

mongoimport --host=localhost --port=27017 --db=lappy --collection=ratings --file=/mongo/lappy_ratings.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

mongoimport --host=localhost --port=27017 --db=lappy --collection=search_results --file=/mongo/news.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

mongoimport --host=localhost --port=27017 --db=lappy --collection=Cases --file=/mongo/Cases.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

mongoimport --host=localhost --port=27017 --db=lappy --collection=Disks --file=/mongo/Disks.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

mongoimport --host=localhost --port=27017 --db=lappy --collection=Headphones --file=/mongo/Headphones.json 2>&1 | \
    grep -E '(document\(s\) imported successfully|document\(s\) failed to import)' | \
    tail -n 1

tail -f /dev/null
