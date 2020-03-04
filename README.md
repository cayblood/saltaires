# Saltaires.org web site

This is a Jekyll-based static web site that is used to manage the web presence
of the Saltaires Barbershop Chorus of Salt Lake City.

## Developing

This assumes that [rvm](http://rvm.io/) and [nvm](https://github.com/nvm-sh/nvm)
are installed in your environment. To set up your environment:
```
rvm install 2.4.0
rvm use 2.4.0@saltaires --create
nvm install lts/carbon
nvm use lts/carbon
npm install -g bower
bundle install
bower install
```
To serve the site locally during development:
```
cd jekyll-site
jekyll serve
```
Then browse to http://localhost:4000

### Enabling seasonal functionality

Note that site files ending in `.md` are in [Markdown
format](https://www.markdownguide.org/basic-syntax/). To turn menu items on and
off, edit `_config.yml`. To activate singing valentines orders, swap the
contents of `valentines-hidden.md` with `valentines.md`, and edit `index.html`
to uncomment promotional callout sections. To change events, edit `events.md`.

Please note that the Valentines ordering functionality relies on a small
lambda-based AWS API endpoint for Stripe server-side validation that is running
in an AWS account to which Carl Youngblood has access. The cost of this endpoint
is negligible and Carl is willing to pay for it indefinitely. It also depends on
our Stripe account, to which Mark Andromidas has access.

## Deploying
```
./deploy.sh
```
