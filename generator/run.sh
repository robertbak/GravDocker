#!/bin/sh
rm ../dockerfiles -R
mkdir ../dockerfiles
mkdir ../dockerfiles/base
mkdir ../dockerfiles/admin
node generate.js