# encoding: utf-8

$RUBYLIBS_DEBUG = true

# 3rd party ruby gems/libs

require 'pluto/models'


# our own code

require 'jekyll/planet/version'    # note: let version always get first




# say hello
puts JekyllPlanet.banner   if $DEBUG || (defined?($RUBYLIBS_DEBUG) && $RUBYLIBS_DEBUG) 

