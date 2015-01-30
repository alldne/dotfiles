#! /usr/bin/env bash
rsync --exclude ".gitmodules" --exclude "LICENSE" --exclude "README.md" --exclude ".git/" --exclude "install.sh" -aP . ~
