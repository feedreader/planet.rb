# encoding: utf-8

$RUBYLIBS_DEBUG = true

# 3rd party ruby gems/libs

require 'pluto/models'


# our own code

require 'jekyll/planet/version'    # note: let version always get first
require 'jekyll/planet/tool'


module JekyllPlanet
  def self.run( args )
    Tool.new.run( args )
  end
  
  def self.main
    self.run( ARGV )
  end
end  # module JekyllPlanet



if __FILE__ == $0
  JekyllPlanet.main
else
  # say hello
  puts JekyllPlanet.banner   if $DEBUG || (defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG) 
end
