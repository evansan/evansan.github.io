#!/bin/zsh
export QT_QMAKE=/usr/local/Cellar/qt/5.10.1/bin
./configure
make -j 4
$QT_QMAKE/macdeployqt src/qbittorrent.app -dmg
