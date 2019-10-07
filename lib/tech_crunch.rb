require 'open-uri'
require 'nokogiri'
require 'pry'
require 'byebug'


require_relative "./tech_sites/version"
require_relative "./tech_sites/article"
require_relative "./tech_sites/cli"
require_relative "./tech_sites/scraper"

module TechCrunch
  class Error < StandardError; end
  # Your code goes here...
end
