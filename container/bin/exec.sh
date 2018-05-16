#!/usr/bin/env bash
set -eu

cd "$(dirname "$0")"

if [ -t 0 ] && [ -t 1 ] ; then
    params=""       # tty
else
    params=" -T"     # no tty
fi

exec ./run.sh$params exec ${@:-php bash}
