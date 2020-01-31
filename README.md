# planet.rb quick starter script - (auto-)add articles & blog posts to your static (jekyll & friends) website via feeds (and planet pluto)


* home  :: [github.com/feedreader/planet.rb](https://github.com/feedreader/planet.rb)
* bugs  :: [github.com/feedreader/planet.rb/issues](https://github.com/feedreader/planet.rb/issues)
* forum :: [groups.google.com/group/wwwmake](http://groups.google.com/group/wwwmake)



## Usage

### Step 1: Planet Pluto Configuration

Use the Planet Pluto machinery to setup your planet and feed list.
Example `planet.ini`:

```
title = Planet Ruby

[rubylang]
  title = Ruby Lang News
  link  = http://www.ruby-lang.org/en/news
  feed  = http://www.ruby-lang.org/en/feeds/news.rss

[rubyconf]
  title = Ruby Conferences 'n' Camps in 2020 - What's Upcoming?
  link  = http://planetruby.github.io/calendar/2020
  feed  = http://planetruby.github.io/calendar/feed.xml

[rubyonrails]
  title = Ruby on Rails Blog
  link  = http://weblog.rubyonrails.org
  feed  = http://weblog.rubyonrails.org/feed/atom.xml

[jekyll]
  title = Jekyll News
  link  = https://jekyllrb.com/news
  feed  = https://jekyllrb.com/feed.xml
```

Use the pluto command line tool
and pass in the planet configuration. Example:

```
$ pluto update planet.ini
```


This will

1) fetch all feeds listed in `planet.ini` and

2) store all entries in a local database, that is, `planet.db` in your working folder.

Resulting in:

```
pluto/1.3.2 on Ruby 2.3.3
[info] db settings:
[info] {:adapter=>"sqlite3", :database=>"./planet.db"}
[info] Updating feed subscription >rubylang< - >http://www.ruby-lang.org/en/feeds/news.rss<...
[info] Updating feed subscription >rubyconf< - >http://planetruby.github.io/calendar/feed.xml<...
[info] Updating feed subscription >rubyonrails< - >http://weblog.rubyonrails.org/feed/atom.xml<...
[info] Updating feed subscription >jekyll< - >https://jekyllrb.com/feed.xml<...
[info] OK - fetching feed 'rubylang' - HTTP status 200 OK
[info] ** NEW | Ruby 2.7.0 Released
[info] ** NEW | Ruby 2.7.0-rc2 Released
[info] ** NEW | Ruby 2.7.0-rc1 Released
[info] ** NEW | Separation of positional and keyword arguments in Ruby 3.0
[info] ** NEW | Ruby 2.7.0-preview3 Released
[info] ** NEW | Ruby 2.7.0-preview2 Released
[info] ** NEW | 2020 Fukuoka Ruby Award Competition - Entries to be judged by Matz
[info] ** NEW | Ruby 2.4.9 Released
[info] ** NEW | CVE-2019-16201: Regular Expression Denial of Service vulnerability of WEBrick's Digest...
[info] ** NEW | Ruby 2.6.5 Released
[info] OK - fetching feed 'rubyconf' - HTTP status 200 OK
[info] ** NEW | Rails Camp West @ Diablo Lake, Washington, United States - Ruby Conferences 'n' Camps Update
[info] ** NEW | RubyConf Belarus (BY) @ Minsk, Belarus - Ruby Conferences 'n' Camps Update
[info] ** NEW | Birmingham on Rails @ Birmingham, Alabama, United States - Ruby Conferences 'n' Camps Update
[info] ** NEW | RubyConf Australia @ Melbourne, Victoria, Australia - Ruby Conferences 'n' Camps Update
[info] ** NEW | ParisRB Conf @ Paris, France - Ruby Conferences 'n' Camps Update
[info] ** NEW | Rubyfuza @ Cape Town, South Africa - Ruby Conferences 'n' Camps Update
[info] OK - fetching feed 'rubyonrails' - HTTP status 200 OK
[info] ** NEW | This week in Rails - Rack 2.1 released, disallowed deprecations, and more!
[info] ** NEW | This week in Rails - Deprecations, bugfixes and improvements!
[info] ** NEW | This week in Rails - The 2019 edition
[info] ** NEW | Ruby 2.7.0, Rails 6.0.2.1 and more
[info] ** NEW | Rails 5.2.4.1 has been released!
[info] ** NEW | Rails 6.0.2.1 has been released!
[info] ** NEW | Rails 6.0.2 has been released!
[info] ** NEW | Rails 6.0.2.rc2 has been released!
[info] ** NEW | Rails 6.0.2.rc1, 5.2.4, and something different…
[info] ** NEW | Rails 5.2.4 has been released!
[info] OK - fetching feed 'jekyll' - HTTP status 200 OK
[info] ** NEW | Jekyll 4.0.0 Released
[info] ** NEW | Jekyll 4.0.0.pre.beta1 Released
[info] ** NEW | Jekyll 3.8.6 Released
[info] ** NEW | Jekyll 4.0.0.pre.alpha1 Released
[info] ** NEW | Jekyll 3.8.5 Released
[info] ** NEW | Security Fixes for series 3.6, 3.7 and 3.8
[info] ** NEW | Sponsoring Jekyll’s development
[info] ** NEW | Jekyll 3.8.3 Released
[info] ** NEW | Jekyll 3.8.2 Released
[info] ** NEW | Jekyll 3.8.1 Released
Done.
```

See the [Planet Pluto documentation for more »](http://feedreader.github.io).




### Step 2: Generate Planet Posts for Your Static (Jekyll & Friends) Website 

Use the planet.rb script to generate the blog posts for your static (jekyll & friends) website. Example:

```
$ ruby ./planet.rb
```


This will

1) fetch the latest entries from the local database, that is, `planet.db` and

2) generate a blog story for every entry in `_posts/`

Resulting in:

```
planet.rb/1.0.0 on Ruby 2.3.3
db settings:
{:adapter=>"sqlite3", :database=>"./planet.db"}
[info] db settings:
[info] {:adapter=>"sqlite3", :database=>"./planet.db"}
[1] This week in Rails - Rack 2.1 released, disallowed deprecations, and more!
[2] Rails Camp West @ Diablo Lake, Washington, United States - Ruby Conferences 'n' Camps Update
[3] RubyConf Belarus (BY) @ Minsk, Belarus - Ruby Conferences 'n' Camps Update
[4] This week in Rails - Deprecations, bugfixes and improvements!
[5] This week in Rails - The 2019 edition
[6] Birmingham on Rails @ Birmingham, Alabama, United States - Ruby Conferences 'n' Camps Update
[7] Ruby 2.7.0, Rails 6.0.2.1 and more
[8] Ruby 2.7.0 Released
[9] Ruby 2.7.0-rc2 Released
[10] Rails 5.2.4.1 has been released!
...
```

And if you check the `_posts/` folder now listing:

```
_posts/
   2019-12-18-rails_5241_has_been_released.html
   2019-12-21-ruby_270-rc2_released.html
   2019-12-25-ruby_270_released.html
   2019-12-27-ruby_270_rails_6021_and_more.html
   2020-01-02-birmingham_on_rails_birmingham_alabama_united_states.html
   2020-01-05-this_week_in_rails_-_the_2019_edition.html
   2020-01-11-this_week_in_rails_-_deprecations_bugfixes_and_improvements.html
   2020-01-16-rails_camp_west_diablo_lake_washington_united_states.html
   2020-01-16-rubyconf_belarus_by_minsk_belarus_-_ruby_conferences_n_camps_update.html
   2020-01-19-this_week_in_rails_-_rack_21_released_disallowed_deprecations_and_more.html
   ...
```

For example
the feed entry "Ruby 2.7.0 Released":

```
<p>We are pleased to announce the release of Ruby 2.7.0.</p>

<p>It introduces a number of new features and performance improvements,
most notably:</p>

<ul>
  <li>Pattern Matching</li>
  <li>REPL improvement</li>
  <li>Compaction GC</li>
  <li>Separation of positional and keyword arguments</li>
</ul>
...
```

becomes `_posts/2019-12-25-ruby_270_released.html`:

```
---
title:      "Ruby 2.7.0 Released"
created_at: 2019-12-25 00:00:00 UTC
author:     Ruby Lang News
layout:     post
original_link: "https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/"
---
<p>We are pleased to announce the release of Ruby 2.7.0.</p>

<p>It introduces a number of new features and performance improvements,
most notably:</p>

<ul>
  <li>Pattern Matching</li>
  <li>REPL improvement</li>
  <li>Compaction GC</li>
  <li>Separation of positional and keyword arguments</li>
</ul>
...
```


### Step 3: Use Your Static (Jekyll & Friends) Website Compiler to Build Your Website

Nothing new. Use your static (jekyll & friends) website compiler 
as usual to build your website. Example:

```
$ jekyll build
```

See the sample live version @ [**`feedreader.github.io/jekyll.planet.sample`**](http://feedreader.github.io/jekyll.planet.sample/) 
[(Source)](https://github.com/feedreader/jekyll.planet.sample).

That's it.





## Examples in the Real World

- [Planet OpenSuse](https://github.com/openSUSE/planet-o-o) - A simple planet, made for openSUSE - Linux OS

Add Your Setup Here!



## License

The `planet.rb` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Send them along to the [wwwmake Forum](http://groups.google.com/group/wwwmake).
Thanks!
