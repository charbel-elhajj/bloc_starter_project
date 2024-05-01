#!/bin/bash
echo 'Validating commit message...'

FILE=$1
MESSAGE=$(cat $FILE)
REGEX='(feat|fix|docs|style|refactor|test|chore)\(\w{1,15}\):\s\w{1,80}(\n\n.*)?'

if ! [[ $MESSAGE=~^$REGEX$ ]];then
  echo 'Invalid commit message. Must match '$REGEX
  exit 1;
fi

echo 'Commit message validation succeded.'
exit 0;
