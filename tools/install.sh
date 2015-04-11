#!/bin/bash

if [[ $1 ]]; then
    project_name=$1
else
    project_name='project_name'
fi

git clone https://github.com/jrperdomoz/djvagrant.git $project_name
cd $project_name
# For fix "sed: RE error: illegal byte sequence"
export LC_CTYPE=C
export LANG=C
find .  -name "*.yml, *.rb, *.conf" -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/$project_name/g'

