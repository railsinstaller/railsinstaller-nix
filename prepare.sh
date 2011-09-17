#!/usr/bin/env zsh

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

export initial_pwd sm_path modules_path sm_script extensions_search_paths
initial_pwd="$PWD"
sm_path="$sm_local_path"
modules_path="${sm_path}/core/sm/shell"
sm_script=/
extensions_search_paths=( $PWD/sm )

. "${modules_path}/core/cli"
. "${modules_path}/core/initialize"

includes rix

TRAPZERR(){
  rix.failed
}
TRAPINT(){
  rix.failed
}
TRAPEXIT(){
  rix.end
}
rix.start
