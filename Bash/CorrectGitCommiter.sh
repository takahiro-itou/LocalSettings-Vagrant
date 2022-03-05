#! /bin/bash  -ue

targetHash='FALSE'
targetDate='FALSE'
commitSign='FALSE'

while [ $# -gt 0 ] ; do
  case  $1  in
    -c) targetHash="$2"   ; shift 2 ;;
    -d) targetDate="$2"   ; shift 2 ;;
    -s) commitSign='TRUE' ; shift 1 ;;
    --) shift 1;  break;;
  esac
done

if [ $# -gt 0 ] ; then
    targetCommits=$1
    shift  1
else
    targetCommits='HEAD'
fi

userName='Takahiro Itou'
userMail='6907757+takahiro-itou@users.noreply.github.com'

if [[ ! ${targetHash} = "FALSE" ]] ; then
    filterArgs+='if [ "${GIT_COMMIT}" = "'
    filterArgs+="${targetHash}"
    filterArgs+='" ] ; then'
elif [[ ! ${targetDate} = "FALSE" ]] ; then
    filterArgs+='if [ "${GIT_AUTHOR_DATE}" = "'
    filterArgs+="${targetDate}"
    filterArgs+='" ] ; then'
else
    filterArgs+='if [ ! "${GIT_COMMITTER_EMAIL}" = "'
    filterArgs+="${userMail}"
    filterArgs+='" ] ; then'
fi
filterArgs+="  GIT_AUTHOR_NAME=\"${userName}\";"
filterArgs+="  GIT_AUTHOR_EMAIL=\"${userMail}\";"
filterArgs+="  GIT_COMMITTER_NAME=\"${userName}\";"
filterArgs+="  GIT_COMMITTER_EMAIL=\"${userMail}\";"
if [[ "${commitSign}" = "TRUE" ]] ; then
    filterArgs+='  git  commit-tree -S "$@" ; '
else
    filterArgs+='  git  commit-tree    "$@" ; '
fi
filterArgs+='else'
filterArgs+='  git  commit-tree "$@" ; '
filterArgs+='fi'

commandOpts='filter-branch  -f --commit-filter'
commandArgs="${commandOpts} '${filterArgs}'  ${targetCommits}"

echo  "Run: git  ${commandArgs}"  1>&2
echo  git  ${commandArgs}
