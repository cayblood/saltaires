source 'https://rubygems.org'
gem 'serve'
gem 'jekyll'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', versions['github-pages']
