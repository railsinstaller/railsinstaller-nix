# RailsInstaller OSX

Rails development environment installer for OS X

Download the latest version: [ [0.9.9 - OSX 10.6](https://rvm.io/src/RailsInstaller-0.9.9-osx-10.6.app.tgz) |
 [0.9.9 - OSX 10.7](https://rvm.io/src/RailsInstaller-0.9.9-osx-10.7.app.tgz) ]

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

To forward ssh session to root:

    time eval sudo /usr/bin/env $(env | grep ^SSH  | sed 's/=\(.*\)$/="\1"/') __no_clean=true ./prepare.sh

And finally to use different license for building:

    echo "export installbuilder_license=$HOME/installbuilder-license.xml" > /etc/rixrc
