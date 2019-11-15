require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'

require_relative "./tech_crunch/version"
require_relative "./tech_crunch/article"
require_relative "./tech_crunch/cli"
require_relative "./tech_crunch/scraper"

module TechCrunch
  class Error < StandardError; end
  # Your code goes here...
end
