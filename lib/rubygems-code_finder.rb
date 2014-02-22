require 'rubygems/code_finder/version'
require 'faraday'

module Rubygems
  module CodeFinder
    extend self
    class RubygemsNotFound < StandardError; end

    def url(name, github_strict: true)
      conn = Faraday.new 'https://rubygems.org'
      response = conn.get('/api/v1/gems/' + name + '.json')
      fail RubygemsNotFound unless response.status == 200
      byebug
    end
  end
end
