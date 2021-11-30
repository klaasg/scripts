#!/bin/bash

dirs=(
    /var/cache/pacman/pkg/
    /home/klaasg/.cache/yay/
)

for dir in "${dirs[@]}"; do
    for pkg in $(find "${dir}" -maxdepth 1 -cmin +5 | grep -v "^${dir}$"); do
        echo "Removing cached $(basename "${pkg}")"
        rm -rf "${pkg}"
        true
    done
done
