
##
##  基本的なエイリアスの設定。
##
##  @file   Bash/LocalAlias.sh
##
##  Copyright (C) 2014/07,  Takahiro Itou.
##  All Rights Reserved.
##

alias  screen='screen -T xterm-256color'

if [ "x${MYBASH_ECHO_LOADING_BASHRC_DETAIL}y" = "xTRUEy" ] ; then
  echo  "Loading  ${HOME}/LocalSettings/Bash/LocalAlias.sh : OK"  1>&2
fi

