require 'rubygems/code_finder/version'
require 'faraday'
require 'multi_json'
require 'uri'

module Rubygems
  module CodeFinder
    extend self
    class RubygemsNotFound < StandardError; end

    def url(name, github_strict: true)
      conn = Faraday.new 'https://rubygems.org'
      response = conn.get('/api/v1/gems/' + name + '.json')
      fail RubygemsNotFound unless response.status == 200
      parse_response_body(response.body)
    end

    def parse_response_body(body)
      data = MultiJson.load(body)
      data['source_code_uri']
    end
  end
end
