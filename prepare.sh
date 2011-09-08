#!/bin/bash

set -o errexit
set -o nounset

if [[ -z "$sm_local_path" || ! -d "$sm_local_path" ]]
then
  printf "sm_local_path is not pointing on a direcotory.\n"
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
