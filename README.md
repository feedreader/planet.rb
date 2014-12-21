# jekyll-planet gem - add articles, blogs to your site via web feeds (and planet pluto)


* home  :: [github.com/feedreader/jekyll-planet](https://github.com/feedreader/jekyll-planet)
* bugs  :: [github.com/feedreader/jekyll-planet/issues](https://github.com/feedreader/jekyll-planet/issues)
* gem   :: [rubygems.org/gems/jekyll-planet](https://rubygems.org/gems/jekyll-planet)
* rdoc  :: [rubydoc.info/gems/jekyll-planet](http://rubydoc.info/gems/jekyll-planet)
* forum :: [groups.google.com/group/feedreader](http://groups.google.com/group/feedreader)


## Usage

### Step 1: Planet Pluto Configuration

Use the Planet Pluto machinery to setup your planet and feed list.
Example `planet.ini`:

~~~
title = Planet Ruby

[rubyflow]
  title  = Ruby Flow
  link   = http://rubyflow.com
  feed   = http://feeds.feedburner.com/Rubyflow?format=xml

[rubyonrails]
  title = Ruby on Rails Blog
  link  = http://weblog.rubyonrails.org
  feed  = http://weblog.rubyonrails.org/feed/atom.xml

[viennarb]
  title = vienna.rb Blog
  link  = http://vienna-rb.at
  feed  = http://vienna-rb.at/atom.xm
~~~

Use the pluto command line tool
and pass in the planet configuration. Example:

~~~
$ pluto update planet.ini
~~~

This will

1) fetch all feeds listed in `planet.ini` and

2) store all entries in a local database, that is, `planet.db` in your working folder.

See the [Planet Pluto docs for more »](http://feedreader.github.io).


### Step 2: Generate Planet Posts for Jekyll

Use Jekyll Planet Ruby script to generate the blog posts for jekyll. Example:

~~~
$ ruby -r 'jekyll/planet' -e 'JekyllPlanet.main'
~~~

This will

1) fetch the latest entries from the local database, that is, `planet.db` and

2) generate a blog story for every entry in `_posts/`

~~~
jekyll-planet/0.2.1 on Ruby 2.1.4 (2014-10-27) [i686-linux]
db settings:
{:adapter=>"sqlite3", :database=>"./planet.db"}
[1] [ANN] Rails 4.2.0.rc3 has been released!
[2] I made a Tic-tac-toe for the Terminal in Ruby
[3] slideshow (S9) RubyGem Update - Adds npm Template Pack Support - $ npm install slideshow-impress.js
[4] Picks / What the vienna.rb Team Thinks Is Worth Sharing This Week
[5] Rack/Rails middleware that will add rel="nofollow" to all your links
...
~~~

For example

~~~
<p>Happy Friday everyone!</p>

<p>The Rails team has just released <a href="http://rubygems.org/gems/rails/versions/4.2.0.rc3">
the third Release Candidate of Rails 4.2.0</a>
today. For an overview of all the major changes in the 4.2 series, please refer
to the <a href="http://edgeguides.rubyonrails.org/4_2_release_notes.html">release notes</a>.</p>
...
~~~

becomes `_posts/2014-12-13-ann_rails_420rc3_has_been_released.html`:

~~~
---
title:      "[ANN] Rails 4.2.0.rc3 has been released!"
created_at: 2014-12-13 03:00:00 UTC
autor:      Ruby on Rails Blog
layout:     post
---
<p>Happy Friday everyone!</p>

<p>The Rails team has just released <a href="http://rubygems.org/gems/rails/versions/4.2.0.rc3">
the third Release Candidate of Rails 4.2.0</a>
today. For an overview of all the major changes in the 4.2 series, please refer
to the <a href="http://edgeguides.rubyonrails.org/4_2_release_notes.html">release notes</a>.</p>
...
~~~


### Step 3: Use Jekyll to Generate Your Site

Nothing new. Use Jekyll as usual to build your site. Example:

~~~
$ jekyll build
~~~

That's it.



## Alternatives

`planet.rb` by Pablo Astigarraga [(Site)](https://github.com/pote/planet.rb) - used with jekyll/octopress site generator




## Install

Just install the gem:

    $ gem install jekyll-planet


## License

The `jekyll-planet` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [Planet Pluto and Friends Forum/Mailing List](http://groups.google.com/group/feedreader).
Thanks!
