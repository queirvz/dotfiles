#! /usr/bin/bash

dpkg -l | grep ^ii | awk '{print $2}' > installed.md

