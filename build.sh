#!/usr/bin/env bash
set -euo pipefail

make PROGRAMS=dropbear
exec /build/dropbear -F -p 2222 -E -r /build/hostkey -m
