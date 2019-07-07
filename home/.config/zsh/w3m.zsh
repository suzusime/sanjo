#!/bin/zsh
function google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='search?num=50&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt
}

function duckduckgo() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='?kl=jp-jp&kp=-2&k1=-1&kv=1'
        opt="${opt}&q=${str}"
    fi
    w3m https://duckduckgo.com/$opt
}

alias ddg="duckduckgo"
