# encoding: utf-8


$RUBYLIBS_DEBUG = true     ## turn on debugging messages for pluto & friends libs


# 3rd party ruby gems/libs
require 'pluto/models'



class Planet

  MAJOR = 1
  MINOR = 0
  PATCH = 0
  VERSION = [MAJOR,MINOR,PATCH].join('.')

  def self.version
    VERSION
  end

  def self.banner
    ### todo: add RUBY_PATCHLEVEL or RUBY_PATCH_LEVEL  e.g. -p124 - why? why not?
    "planet.rb/#{VERSION} on Ruby #{RUBY_VERSION} (#{RUBY_RELEASE_DATE}) [#{RUBY_PLATFORM}]"
  end

  


  def initialize
    puts self.class.banner     ##  print banner / say hello

    puts "db settings:"

    @db_config = {
      adapter: 'sqlite3',
      database: './planet.db'
    }

    pp @db_config
  end


  def run( args )
    unless File.exists?( @db_config[:database])
      puts "** error: database #{@db_config[:database]} missing; please check pluto documention for importing feeds etc."
      exit 1
    end

    Pluto.connect( @db_config )

    Pluto::Model::Item.latest.limit(10).each_with_index do |item,i|
      puts "[#{i+1}] #{item.title}"
  
      generate_blog_post( item )
    end
  end


  def generate_blog_post( item )

    posts_root = "./_posts"

    FileUtils.mkdir_p( posts_root )  ## make sure path exists

    ## note:
    ##  jekyll pattern for blogs must follow
    ##    2020-12-21-  e.g. must include trailing dash (-)
    fn = "#{posts_root}/#{item.published.strftime('%Y-%m-%d')}-#{title_to_key(item.title)}.html"

    frontmatter =<<TXT
---
title:      "#{item.title.gsub("\"","\\\"")}"
created_at: #{item.published}
author:     #{item.feed.title}
layout:     post
original_link: "#{item.url unless item.url.empty?}"
---
TXT


    File.open( fn, 'w:utf-8' ) do |f|
      f.write frontmatter

      if item.content
        f.write item.content
      elsif item.summary
        f.write item.summary
      else
        ## warn: not content found for feed
      end
    end
  end


private

def title_to_key( title )
  
  ### fix: use textutils.title_to_key ??
  key = title.downcase
  key = key.gsub( 'ü', 'ue' )
  key = key.gsub( 'é', 'e' )

  key = key.gsub( /[^a-z0-9\- ]/, '' )  ## for now remove all chars except a-z and 0-9
  key = key.strip
  key = key.gsub( /[ ]+/, '_' )

  if key.blank?   ## note: might result in null string (use timestamp)
    key = "post#{Time.now.strftime('%Y%m%d%H%M%S%L')}"
  end

  key
end

end  ## class Planet




##############################
#  main entry - let's run

Planet.new.run( ARGV )      if __FILE__ == $0


