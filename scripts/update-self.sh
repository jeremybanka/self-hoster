#!/bin/bash

username=$(whoami)

sudo git pull

sudo chown $(username):$(username) ./package.json