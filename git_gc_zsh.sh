#!/bin/zsh

ZSH_BASE_DIR=$(cd ~/.zsh; pwd)
ZSH_REPOSITORIES=($ZSH_BASE_DIR/*)

ANTIGEN_BASE_DIR=$(cd ~/.antigen; pwd)
ANTIGEN_REPOSITORIES=($ANTIGEN_BASE_DIR/repos/*)


echo "------------ initialize ----------------"

echo "zsh base directry $ZSH_BASE_DIR"
echo "zsh repositories $ZSH_REPOSITORIES"

echo "antigen base directry $ANTIGEN_BASE_DIR"
echo "antigen repositories $ANTIGEN_REPOSITORIES"

echo "------------ initialize ----------------"

for repo in ${ZSH_REPOSITORIES[@]}
  do
    echo "---------- update start ----------------"
    echo "into repository directry $repo"
    cd $repo
    echo "git gc start $repo"
    git gc
    echo "git gc end $repo"
    cd $ZSH_BASE_DIR
    echo "out repository directry $repo"
    echo "---------- update end ------------------"
  done

for repo in ${ANTIGEN_REPOSITORIES[@]}
  do
    echo "---------- update start ----------------"
    echo "into repository directry $repo"
    cd $repo
    echo "git gc start $repo"
    git gc
    echo "git gc end $repo"
    cd $ANTIGEN_BASE_DIR
    echo "out repository directry $repo"
    echo "---------- update end ------------------"
  done

echo "------------- done ---------------------"
