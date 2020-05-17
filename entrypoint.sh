#!/usr/bin/env bash
set -euo pipefail

autoconf
autoheader
./configure --enable-static

echo "hang"
tail -f /dev/null &
wait $!
