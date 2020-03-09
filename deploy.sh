#!/bin/bash

super_echo() {
  echo
  echo "============================================================="
  echo $1
  echo "============================================================="
  echo
}

CURRENT_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
fi

export NVM_DIR="$HOME/.nvm"
[[ -s /usr/local/opt/nvm/nvm.sh ]] && . /usr/local/opt/nvm/nvm.sh
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

cd $CURRENT_SCRIPT_DIR

super_echo "Setting up nvm..."
nvm use lts/carbon

super_echo "Checking out master branch..."
git checkout master

super_echo "Installing bower dependencies..."
npm install -g bower
bower install

super_echo "Building jekyll site..."
cd jekyll-site
jekyll build

super_echo "Copying result to temp dir..."
cd ..
rm -rf /tmp/_site
cp -r jekyll-site/_site /tmp

super_echo "Cloning saltaires repo in /tmp..."
cd /tmp
git clone git@github.com:cayblood/saltaires.git
cd saltaires

super_echo "Checking out gh-pages branch..."
git checkout gh-pages

super_echo "Removing existing branch content..."
rm -rf *
mv /tmp/_site/* .
echo -e "www.saltaires.org\n" > CNAME

super_echo "Committing newly-built content in gh-pages branch..."
git add .
git commit -m "deploy"

super_echo "Pushing changes to remote gh-pages branch..."
git push -f origin gh-pages:gh-pages
cd ..

super_echo "Removing local copy..."
rm -rf saltaires
