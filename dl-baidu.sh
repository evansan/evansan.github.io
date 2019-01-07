#!/bin/bash

if [ $# -eq 0 ]
  then
	read -p "Name of the folder to download:" dirname
  else
	dirname="$@"
fi

BaiduPCS-Go config set -appid=266719

sleep 1

BaiduPCS-Go cd /

BaiduPCS-Go mv $dirname /apps/baidu_shurufa/

BaiduPCS-Go cd /apps/baidu_shurufa/

BaiduPCS-Go config set -appid=265486

sleep 1

tmux new-session -d -s `date +%H-%M-%S` BaiduPCS-Go d $dirname


