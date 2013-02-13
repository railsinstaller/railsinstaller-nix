#!/usr/bin/env sh

PROJECTS=$1
BUILDER=$2

if
  [[ -z "$PROJECTS" || -z "$BUILDER" ]]
then
  printf "Use\n  $0 /path/to/projects /path/to/installbuilder\n"
  exit 1
fi

[[ -d "$PROJECTS" ]] || mkdir -p "$PROJECTS"

pushd $PROJECTS >/dev/null
for project in sm/sm wayneeseguin/rvm railsinstaller/railsinstaller-nix
do
  dir=${project#*/}
  [[ -d $dir ]] ||
  {
    printf -- "-- preparing $dir :\n"
    mkdir -p $dir
    curl -L https://github.com/$project/archive/master.tar.gz | tar xz --strip-components=1 -C $dir
  }
done
popd >/dev/null

__package=""
case $(sw_vers -productVersion) in
  10.6.*)        __package="GCC-10.6.pkg"    ;;
  10.7.*|10.8.*) __package="GCC-10.7-v2.pkg" ;;
esac
[[ -z "${__package:-}" ]] ||
{
  sudo mkdir -p /opt/rix &&
  sudo curl -kL https://github.com/downloads/kennethreitz/osx-gcc-installer/${__package} -o /opt/rix/${__package} &&
  sudo installer -package /opt/rix/${__package} -target / ||
  echo "Failed downloading/installing ${__package}"
}

printf -- "-- paths in /etc/rixrc :\n"
printf "\
export sm_local_path=$PROJECTS/sm\n\
export rvm_local_path=$PROJECTS/rvm\n\
export installbuilder_path=$BUILDER\n\
" | sudo tee /etc/rixrc
