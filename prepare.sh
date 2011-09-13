#!/bin/bash

set -o errexit
set -o nounset

__initial_env=( $(env) )

if (( UID ))
then
  printf "This script should be run only by root, you can use sudo to do that.\n"
  exit 1
fi

if [[ -z "$sm_local_path" || ! -d "$sm_local_path" ]]
then
  printf "sm_local_path='${sm_local_path}' is not pointing on a direcotory.\n"
  [[ -z "${SUDO_USER}" ]] ||
    printf "For sudo remember to add it to /etc/sudoers 'Defaults env_keep = \"...\".'\n"
  exit 1
fi

if [[ -z "${rvm_local_path:-}" || ! -d "${rvm_local_path}" ]]
then
  printf "rvm_local_path='${rvm_local_path:-}' is not pointing on a direcotory.\n"
  [[ -z "${SUDO_USER}" ]] ||
    printf "For sudo remember to add it to /etc/sudoers 'Defaults env_keep = \"...\".'\n"
  exit 1
fi

export initial_pwd="$PWD"
export sm_path="$sm_local_path"
export modules_path="${sm_path}/core/sm/shell"
export sm_script=/
export extensions_search_paths=( $PWD/sm )

. "${modules_path}/core/cli"
. "${modules_path}/core/initialize"

modules rix

trap "rix.failed" ERR
trap "rix.end" EXIT
rix.start
