#!/usr/bin/env sh

_() {
  YEAR="1989"
  DATE="1989-04-25T18:00:00"
  echo "GitHub Username: "
  read -r USERNAME
  echo "GitHub Access token: "
  read -r ACCESS_TOKEN

  [ -z "$USERNAME" ] && exit 1
  [ -z "CCESS_TOKEN" ] && exit 1  
  [ ! -d $YEAR ] && mkdir $YEAR

  cd "${YEAR}" || exit
  git init
  echo "**${YEAR}** - When everything started." \
    >README.md
  git add .
  GIT_AUTHOR_DATE="${DATE}" \
    GIT_COMMITTER_DATE="${DATE}" \
    git commit -m "${YEAR}"
  git remote add origin "https://${ACCESS_TOKEN}@github.com/${USERNAME}/${YEAR}.git"
  git branch -M main
  git push -u origin main -f
  cd ..
  rm -rf "${YEAR}"

  echo
  echo "Cool, check your profile now: https://github.com/${USERNAME}"
} && _

unset -f _
