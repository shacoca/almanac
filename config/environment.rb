# First Load Bundler
require 'bundler'
# Require the Gems  from the Gemfile using Bundler
Bundler.require

# load libraries
require_all './lib'

# load other stuff
require_all 'lib'
require 'net/http'
require 'uri'
require 'open-uri'
require 'nokogiri'
require 'pry'

require "bundler/setup"
require "almanac"

# module Concerns
# end

SITE = "https://www.almanac.com"

def reload!
    load_all './lib'
end

task :console do
    Pry.start
end
