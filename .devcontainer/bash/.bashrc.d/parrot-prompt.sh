#!/bin/bash
# see https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo -e "($venv) "
}


check_errs()
{
  # Function. Parameter 1 is the return code
  if [ "${1}" -ne "0" ]; then
    echo "[✗:${1}]─"
    # as a bonus, make our script exit with the right error code.
    # exit ${1}
  fi
}


source $DIR/colors.sh

function parrot_prompt() {
  if [[ ${EUID} == 0 ]]; then 
    PROMPT="#";
  else
    PROMPT="$";
  fi
  export PROMPT 
if [ "$1" = yes ]; then
    PS1="$RED╭─\$(check_errs \$?)\
[\$(if [[ ${EUID} == 0 ]]; \
    then echo \"$LIGHT_RED\u$YELLOW@$BICyan\h\"; \
    else echo \"$DEFAULT_COLOR\u$YELLOW@$BICyan\h\"; fi)\
$RED]─[$GREEN\w$RED]\$(__git_ps1 \" $BICyan(%s)\")\
\n$RED╰──╼ $BIPurple\$(virtualenv_info)${YELLOW}${PROMPT}$NO_COLOR "
else
    PS1="┌──[\u@\h]─[\w]\$(__git_ps1 \" (%s)\")\n└──╼ \$(virtualenv_info)\$ "
fi

}

