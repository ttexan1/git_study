#!/usr/bin/bash

mkdir explanation
mkdir reset_hard_1
mkdir reset_hard_2
mkdir commit_amend
mkdir commit_revert
mkdir stash_content
mkdir lost_branch
mkdir incorrect_branch
mkdir organize_commit
mkdir secret_key

initial_commit() {
  git init;
  touch initial.html;
  git add -A;
  git commit -m $(basename `pwd`)
}

echo "make all dir"

# explanation
cd explanation
git init
mkdir dir1
echo "html" >> dir1/index.html
git add -A; git commit -m "v1 add1/index.html"
mkdir dir2
echo "html" >> dir2/index.html
git add -A; git commit -m "v2 add2/index.html"
echo "html" >> git.html
git add -A; git commit -m "v3 add3/index.html"


#①
cd ../reset_hard_1
initial_commit
touch fruites.html
echo "organe" >> fruites.html
git add -A; git commit -m "add orange"
echo "apple" >> fruites.html
git add -A; git commit -m "add apple"
echo "grape" >> fruites.html
git add -A; git commit -m "add grape"

echo "make①"
#②
cd ../reset_hard_2
initial_commit
touch fruites.html
echo "organe" >> fruites.html
git add -A; git commit -m "add orange"
echo "apple" >> fruites.html
git add -A; git commit -m "add apple"
echo "grape" >> fruites.html
git add -A
git reset --hard HEAD@{1}

echo "make2"
#③
cd ../commit_amend
initial_commit
touch vegetable.html
echo "タネを植える" >> vegetable.html
echo "水をやる" >> vegetable.html
echo "収穫する" >> vegetable.html
git add -A; git commit -m "how to bring vegetable"
echo "食べる" >> vegetable.html
git add -A; git commit --amend

echo "make3"
#④
cd ../commit_revert
initial_commit
touch ver1.html
git add -A; git commit -m "make ver1";
touch ver2.html
git add -A; git commit -m "make ver2";
# git push -u origin master

echo "make4"
#⑤
cd ../stash_content
initial_commit

git checkout -b suites
touch suites.html; echo gelato >> suites.html
git add -A; git commit -m 'make suites.html'
echo choucream >> suites.html
git stash

git checkout master

git checkout -b dessert
touch dessert.html; echo icecream >> dessert.html
git add -A; git commit -m 'make dessert.html'
echo sherbet >> dessert.html
git stash save 'add sherbet'

echo "make5"
#⑥
cd ../lost_branch
initial_commit
git checkout -b develop
touch index.html
echo "develop1" >> index.html
git add -A; git commit -m "make develop1";
echo "develop2" >> index.html
git add -A; git commit -m "make develop2";
echo "develop3" >> index.html
git add -A; git commit -m "make develop3";
git checkout master
git checkout -b another-develop
touch another.html
echo "another" >> index.html
git add -A; git commit -m "make another";
git branch -D develop

echo "make6"
#⑦
cd ../incorrect_branch
initial_commit
git checkout -b develop
touch index.html
echo "develop1" >> index.html
git add -A; git commit -m "make develop1";
echo "develop2" >> index.html
git add -A; git commit -m "make develop2";
echo "incorrect commitだよ" >> index.html
git add -A; git commit -m "make develop3";
git checkout master
git checkout -b another-develop

echo "make7"
#⑧
cd ../organize_commit
initial_commit
git checkout develop
touch index.html

echo "コミット1" >> index.html
git add -A; git commit -m "田中さんの依頼";
echo "コミット2" >> index.html
git add -A; git commit -m "佐藤さんの依頼";
echo "コミット3" >> index.html
git add -A; git commit -m "鈴木さんの依頼";
echo "コミット4" >> index.html
git add -A; git commit -m "田中さんの依頼";
echo "コミット5" >> index.html
git add -A; git commit -m "佐藤さんの依頼";
echo "コミット6" >> index.html

git add -A; git commit -m "鈴木さんの依頼";
# 変更の可能性あり(コンフリクトどうだろうかわからない)

echo "make8"
#⑨
cd ../secret_key
initial_commit
mkdir config
touch config/secrets.yml
touch config/settings.rb
touch fruites.html
touch .gitignore

echo "git使える様になったよ" >> fruites.html
git add -A; git commit -m "make fruites.html"
echo "キー: 1234" > config/auth_key
git add -A; git commit -m "make change"
echo "オレンジ" > fruites.html
git add -A; git commit -m "add orange";
echo "キー: abcd" > config/auth_key
git add -A; git commit -m "make change"
echo "アップル" > fruites.html
git add -A; git commit -m "add apple"
echo "finish"
