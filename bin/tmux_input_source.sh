#!/bin/bash

case $(xkbswitch -ge) in
    RussianWin)
        symbol=' RU '
        ;;
    *)
        symbol=""
esac
echo -n '#[fg=brightwhite,bold,bg=red]'$symbol'#[fg=white,default,bg=black]'
