#!/usr/bin/bash

mkdir fix_conflict
cd fix_conflict
git init; mkdir secrets; touch secrets/country_key.json; touch .gitignore;
git add -A; git commit -m "initial commit";

git checkout -b japan
echo "japan:key" >> secrets/country_key.json; touch japan.txt;
git add -A; git commit -m "make japan branch"
echo "Kyoto" >> japan.txt; git add -A; git commit -m "add Kyoto"

echo "Aomori" >> japan.txt; git add -A
git reset --hard HEAD@{1}

echo "Hiroshima" >> japan.txt; git add -A; git commit -m "add Hiroshima"
echo "Hokkaido" >> japan.txt; git add -A; git commit -m "add Hokkaido"
echo "Tokyo" >> japan.txt; git add -A; git commit -m "add Tokyo"


git checkout master

git checkout -b america

echo "Florida" >> america.txt; git add -A; git commit -m "add Florida"
echo "Bigban" >> america.txt; git stash;
echo "London" >> british.txt; git add -A; git commit -m "add London"
echo "残念！このStashは引っ掛けだよ！" >> america.txt; git stash save "ヒント：git show stash{0}で中を確認して見よう";
git checkout -b _america_
echo "Louisiana" >> america.txt; git add -A; git commit -m "add Louisiana"

git checkout america

echo "NewYork" >> america.txt; git add -A; git commit -m "add NewYork"

git checkout master

git checkout -b france

echo "Paris" >> france.txt; git add -A; git commit -m "add Paris"
echo "Marseille" >> france.txt; git add -A; git commit -m "add Marseille"
git checkout america
echo "Ohio" >> america.txt; git add -A; git commit -m "add Ohio"
git checkout france
echo "Bordeaux" >> france.txt; git add -A; git commit -m "add Bordeaux"
echo "Saint-Paul" >> france.txt; git add -A; git commit -m "add Saint-Paul"

git checkout master
git checkout japan
echo "Ibaraki" >> japan.txt; echo "Chiba" >> japan.txt
git add -A; git commit -m "add Ibaraki and Chiba"
git checkout master

git branch -D france

git checkout -b british

echo "Northern Ireland Belfast" >> british.txt; git add -A; git commit -m "add Northern Ireland Belfast"
echo "Scotland Edinburgh" >> british.txt; git add -A; git commit -m "add Scotland Edinburgh"
echo "Wales Cardiff" >> british.txt; git add -A; git commit -m "add Wales Cardiff"
