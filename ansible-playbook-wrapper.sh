#!/usr/bin/env bash

ANSIBLE_VERSION=2.2.1.0
ANSIBLE_ROOT=~/.ansible
ANSIBLE_PATH=~/.ansible/ansible-$ANSIBLE_VERSION
ANSIBLE_TAR_FILE=ansible-$ANSIBLE_VERSION.tar.gz

if [ ! -d $ANSIBLE_ROOT ]; then
  mkdir -p $ANSIBLE_ROOT
fi

if [ ! -d $ANSIBLE_PATH ]; then
  echo Download ansible version: $ANSIBLE_VERSION

  curl http://releases.ansible.com/ansible/$ANSIBLE_TAR_FILE -o $ANSIBLE_ROOT/$ANSIBLE_TAR_FILE
  tar -xzvf $ANSIBLE_ROOT/$ANSIBLE_TAR_FILE -C $ANSIBLE_ROOT
  rm -f $ANSIBLE_ROOT/$ANSIBLE_TAR_FILE
fi

export PYTHONPATH=$ANSIBLE_PATH/lib
$ANSIBLE_PATH/bin/ansible-playbook "$@"
