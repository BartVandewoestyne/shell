#!/usr/bin/env bash
#
# Test to see how variables are passed from a script that gets called.

. ./local_global_inner.sh

echo "foo in outer script: ${foo}"
