#!/bin/sh
declare -a versions=("1.3.4" "1.3.3" "1.3.1" "1.3.0" "1.2.4" "1.2.3" "1.2.0" "1.1.17" "1.1.16" "1.1.15" "1.1.14")
latest=${versions[0]}

rm ../dockerfiles -R
mkdir ../dockerfiles

for i in "${versions[@]}"
do
   mkdir ../dockerfiles/"$i"
   cp Dockerfile.template ../dockerfiles/"$i"/Dockerfile
   sed -i "s/_GRAV_VERSION_/$i/g" ../dockerfiles/"$i"/Dockerfile
   cp init.sh ../dockerfiles/"$i"
done

mkdir ../dockerfiles/latest
cp Dockerfile.template ../dockerfiles/latest/Dockerfile
sed -i "s/_GRAV_VERSION_/$latest/g" ../dockerfiles/latest/Dockerfile
cp init.sh ../dockerfiles/latest
