#!/bin/bash

game=`grep 'game ' config/config.txt | awk '{print $2}'`
game="${game//$'\r'/}"
movie=`grep 'movie ' config/config.txt | awk '{print $2}'`
movie="${movie//$'\r'/}"

if [ "$1" = "--learnfun" ]; then
    ./learnfun
else
    ./playfun "$@"
fi