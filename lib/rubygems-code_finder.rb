require 'rubygems/code_finder/version'
require 'faraday'
require 'multi_json'
require 'uri'

module Rubygems
  module CodeFinder
    extend self
    class RubygemsNotFound < StandardError; end
    class RepositoryNotFound < StandardError; end

    def url(name, github_strict: true)
      conn = Faraday.new 'https://rubygems.org'
      response = conn.get('/api/v1/gems/' + name + '.json')
      fail RubygemsNotFound unless response.status == 200
      parse_response_body(response.body)
    end

    def parse_response_body(body)
      data = MultiJson.load(body)
      return data['source_code_uri'] if URI.parse(data['source_code_uri']).host == 'github.com'
      return data['homepage_uri'] if URI.parse(data['homepage_uri']).host == 'github.com'
      fail RepositoryNotFound
    end
  end
end
