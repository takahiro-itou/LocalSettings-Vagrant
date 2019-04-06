
alias  check='make     check ; echo $?'
alias  checks='make -s check | sed "/^Making check in /d"'

alias  m='clear  ; clear ; time  make     ; echo $?'
alias  ms='clear ; clear ; time  make -s  ; echo $?'
alias  ma='clear ; clear ; time  make '
alias  mas='clear; clear ; time  make -s '
alias  mc='make  clean '
alias  mr='make  clean  ; clear ; clear ; time  make    ; echo $?'
alias  mrs='make  clean ; clear ; clear ; time  make -s ; echo $?'

alias  yes='/usr/bin/yes |  head  --lines=30'

