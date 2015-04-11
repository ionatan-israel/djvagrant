#!/bin/bash

if [[ $1 ]]; then
    project_name=$1'/g'
else
    project_name='project_name/g'
fi

git clone https://github.com/jrperdomoz/djvagrant.git $1
cd $1

# For fix "sed: RE error: illegal byte sequence"
export LC_CTYPE=C
export LANG=C
find . -type f \( -name "*conf" -o -name "*rb" -o -name "*yml" -o -name "*dev" \) -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/'$project_name
# find . -name "*.conf" -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/'$project_name
# find . -name "*.rb" -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/'$project_name
# find . -name "*.yml" -print0 | xargs -0 sed -i '' -e 's/{{project_name}}/'$project_name

mv Vagrantfile.rb Vagrantfile
