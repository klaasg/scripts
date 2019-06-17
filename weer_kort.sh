#!/bin/bash

curl wttr.in/~${1:-Gent}?format=1 2>/dev/null
