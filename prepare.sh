#!/bin/bash

set -o errexit
set -o nounset

export initial_pwd="$PWD"
export sm_path="$sm_local_path"
export modules_path="${sm_path}/core/sm/shell"
export sm_script=/
export extensions_search_paths=( $PWD/sm )

. "${modules_path}/core/cli"
. "${modules_path}/core/initialize"

modules rix
