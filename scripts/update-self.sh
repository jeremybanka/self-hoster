#!/bin/bash

USERNAME=$(whoami)

sudo git pull

sudo chown $USERNAME:$USERNAME ./package.json