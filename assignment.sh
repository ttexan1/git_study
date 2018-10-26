#!/usr/bin/bash

mkdir fix_conflict
cd fix_conflict
git init; mkdir secrets; touch secrets/country_key.json; touch .gitignore;
git add -A; git commit -m "initial commit";

git checkout -b japan
echo "japan key" >> secrets/country_key.json;
echo "Hiroshima" >> japan.txt; git add -A; git commit -m "add Hiroshima"
echo "Kyoto" >> japan.txt; git add -A; git commit -m "add Kyoto"
echo "Aomori" >> japan.txt; git add -A; git commit -m "add Aomori"
echo "Tokyo" >> japan.txt; git add -A; git commit -m "add Tokyo"
echo "Hokkaido" >> japan.txt; git add -A; git commit -m "add Hokkaido"
echo "Ibaraki" >> japan.txt; echo "Chiba" >> japan.txt
git add -A; git commit -m "add Ibaraki and Chiba"

git checkout master

git checkout -b america

echo "Florida" >> america.txt; git add -A; git commit -m "add Florida"
echo "London" >> america.txt; git add -A; git commit -m "add London"
echo "Icklkve" >> america.txt; git stash;
echo "Bigban" >> amrica.txt; git stash -m "space X";
git checkout -b _america_
echo "Louisiana" >> america.txt; git add -A; git commit -m "add Louisiana"

git checkout america

echo "NewYork" >> america.txt; git add -A; git commit -m "add NewYork"
echo "Ohio" >> america.txt; git add -A; git commit -m "add Ohio"

git checkout master

git checkout -b france

echo "Paris" >> france.txt; git add -A; git commit -m "add Paris"
echo "Marseille" >> france.txt; git add -A; git commit -m "add Marseille"
echo "Bordeaux" >> france.txt; git add -A; git commit -m "add Bordeaux"
echo "Saint-Paul" >> france.txt; git add -A; git commit -m "add Saint-Paul"

git checkout master

git branch -D france

git checkout -b british

echo "Scotland Edinburgh" >> british.txt; git add -A; git commit -m "add Scotland Edinburgh"
echo "Northern Ireland Belfast" >> british.txt; git add -A; git commit -m "add Northern Ireland Belfast"
echo "Wales Cardiff" >> british.txt; git add -A; git commit -m "add Wales Cardiff"
