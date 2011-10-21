# RailsInstaller OSX

Rails development environment installer for OS X

## Overview

The goal of this project is to generate an installer that when run
installs all of the most common components for a Rails development environment
with no required prerequisites on a OS X system.

## Prerequisites - SM Framework & RVM

Local copy is used to build installer, so any branch/version locally downloaded
will be used. For quick configuration in ~/projects use:

    ./prepare_local.sh ~/projects ~/installbuilder

## Building installer

Installer will automatically go through all required steps:

    sudo ./prepare.sh

As the installer xml scrip is not included there will be no output of the process,
to keep the prepared files use --no-clean flag, which will prevent the process from cleaning after itself:

    sudo ./prepare.sh --no-clean
