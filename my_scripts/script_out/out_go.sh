#!/bin/bash
function proxy_on() {
    if [ -n "$1" ]; then
        port="$1"
    else
        port="7890"
    fi

    export http_proxy="http://127.0.0.1:${port}"
    export https_proxy="http://127.0.0.1:${port}"
    export all_proxy="socks5://127.0.0.1:${port}"
    echo -e "proxy on，port is ${port}"
    curl cip.cc
}

function proxy_off() {
    unset http_proxy
    unset https_proxy
    echo -e "proxy turn off"
    curl cip.cc
}

function weather() {
    curl 'wttr.in/{Shanghai, Yancheng}?format=4'
}

