#!/bin/bash

export "$(grep -v '^#' .env | xargs)"

ansible-playbook ansible/setup.yml --ask-become-pass
