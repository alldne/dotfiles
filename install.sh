#! /usr/bin/env bash
rsync --exclude "LICENSE" --exclude "README.md" --exclude ".git/" --exclude "install.sh" -aP . ~
