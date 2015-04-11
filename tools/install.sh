#!/bin/bash

if [[ $1 ]]; then
    project_name = $1
else
    project_name = 'project_name'
fi

wget https://github.com/jrperdomoz/djvagrant/archive/master.zip
unzip master.zip
cd djvagrant
find . -type f -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/$project_name/g'
echo "=)"
