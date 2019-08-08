#!/usr/bin/env ruby
require "artii"

puts $LOAD_PATH

arter = Artii::Base.new

puts arter.asciify("whoa")
