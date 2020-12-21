#!/bin/sh
cd symbol-news/
setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config pull.ff only
  git config receive.denyNonFastForwards false
}
commit_website_files() {
  cat index.html
  git remote add origin-pages https://${GITHUB_TOKEN}@${NEWS_REPO_REF} > /dev/null 2>&1
  git remote update
  git checkout gh-pages
  cat index.html
  git add . *.html
  git commit -m "Travis Build:  $TRAVIS_BUILD_NUMBER" --allow-empty 
}

upload_files() {
  git push  --set-upstream origin-pages gh-pages -f
  # git push --quiet  origin-pages :gh-pages  -f
}
setup_git
commit_website_files
upload_files