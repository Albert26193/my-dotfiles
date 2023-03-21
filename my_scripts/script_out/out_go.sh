#!/bin/bash
function proxy_on() {
  export http_proxy="http://127.0.0.1:7890"
  export https_proxy="http://127.0.0.1:7890"
  echo -e "already turn on the proxy"
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

