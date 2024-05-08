#!/bin/bash

mkdir -p $HOME/bin

ln -s /opt/packages/educates/bin/educates-linux-$PLATFORM_ARCH $HOME/bin/educates

if [[ ! -f $HOME/.bash_profile || ! $(grep -q "__start_educates" $HOME/.bash_profile) ]]; then
    /opt/packages/educates/bin/educates-linux-$PLATFORM_ARCH completion bash >> $HOME/.bash_profile
fi
