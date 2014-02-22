require 'rubygems/code_finder/version'
require 'faraday'
require 'multi_json'

module Rubygems
  module CodeFinder
    extend self
    class RubygemsNotFound < StandardError; end

    def url(name, github_strict: true)
      conn = Faraday.new 'https://rubygems.org'
      response = conn.get('/api/v1/gems/' + name + '.json')
      fail RubygemsNotFound unless response.status == 200
      body = MultiJson.load(response.body)
      body['source_code_uri']
    end
  end
end
