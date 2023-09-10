#!/usr/bin/env bash

read_stuff() {
    foo="foo"
}

read_stuff

echo "foo in inner script: ${foo}"
