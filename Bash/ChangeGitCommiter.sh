#! /bin/bash  -ue

userName='Takahiro Itou'
userMail='6907757+takahiro-itou@users.noreply.github.com'

filterArgs="GIT_AUTHOR_NAME='${userName}';"
filterArgs="${filterArgs} GIT_AUTHOR_EMAIL='${userMail}';"
filterArgs="${filterArgs} GIT_COMMITTER_NAME='${userName}';"
filterArgs="${filterArgs} GIT_COMMITTER_EMAIL='${userMail}';"

commandArgs="filter-branch  -f --env-filter \"${filterArgs}\"  HEAD"

echo  "Run: git  ${commandArgs}"  1>&2
echo  git  ${commandArgs}

