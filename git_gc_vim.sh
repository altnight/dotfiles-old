#!/bin/bash

BASE_DIR=$(cd ~/.vim; pwd)
REPOSITORIES=($BASE_DIR/*)

echo "base directry $BASE_DIR"
echo "repositories $REPOSITORIES"

echo "------------ initialize ----------------"

for repo in ${REPOSITORIES[@]}
  do
    echo "---------- update start ----------------"
    echo "into repository directry $repo"
    cd $repo
    echo "git gc start $repo"
    git gc
    echo "git gc end $repo"
    cd $BASE_DIR
    echo "out repository directry $repo"
    echo "---------- update end ------------------"
  done

echo "------------- done ---------------------"
