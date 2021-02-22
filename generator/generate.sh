#!/bin/sh
declare -a versions=("1.7.6" "1.7.5" "1.6.31" "1.6.27" "1.6.26" "1.6.23" "1.6.19" "1.6.16" "1.6.9" "1.6.8" "1.6.7" "1.6.5" "1.5.8" "1.5.6" "1.5.5" "1.5.2" "1.5.1" "1.4.8" "1.4.5" "1.4.3" "1.4.2" "1.4.1" "1.3.10" "1.3.8" "1.3.6" "1.3.5" "1.3.4" "1.3.3" "1.3.1" "1.3.0" "1.2.4" "1.2.3" "1.2.0" "1.1.17" "1.1.16" "1.1.15" "1.1.14")
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
