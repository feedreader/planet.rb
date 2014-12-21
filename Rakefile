require 'hoe'
require './lib/jekyll/planet/version.rb'

Hoe.spec 'jekyll-planet' do

  self.version = JekyllPlanet::VERSION

  self.summary = "jekyll-planet - add articles, blogs to your site via web feeds (and planet pluto)"
  self.description = summary

  self.urls    = ['https://github.com/feedreader/jekyll-planet']

  self.author  = 'Gerald Bauer'
  self.email   = 'feedreader@googlegroups.com'

  # switch extension to .markdown for gihub formatting
  self.readme_file  = 'README.md'
  self.history_file = 'HISTORY.md'

  self.extra_deps = [
    ['pluto-models',  '>= 1.3.0'],
  ]

  self.licenses = ['Public Domain']

  self.spec_extras = {
    required_ruby_version: '>= 1.9.2'
  }

end

