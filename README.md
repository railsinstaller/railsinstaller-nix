# RailsInstaller OSX

Rails development environment installer for OS X

## Overview

The goal of this project is to generate an installer that when run
installs all of the most common components for a Rails development environment
with no required prerequisites on a OS X system.

## Prerequisites - SM Framework & RVM

Local copy is used to build installer, so any branch/version locally downloaded
will be used. For quick configuration in ~/projects and with [installbuilder](http://installbuilder.bitrock.com/) use:

    ./prepare_local.sh ~/projects ~/installbuilder

## Building installer

Installer will automatically go through all required steps:

    sudo ./prepare.sh

To keep the prepared files use __no_clean variable, which will prevent the process from cleaning after itself:

    sudo __no_clean=true ./prepare.sh

Download the latest version for: [ [0.9.7 - OSX 10.6](https://rvm.beginrescueend.com/src/RailsInstaller-0.9.7-osx-10.6-installer.app.tar.gz) |
 [0.9.7 - OSX 10.7](https://rvm.beginrescueend.com/src/RailsInstaller-0.9.7-osx-10.7-installer.app.tar.gz) ]
