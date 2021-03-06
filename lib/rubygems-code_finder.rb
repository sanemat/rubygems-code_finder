require 'rubygems/code_finder/version'
require 'faraday'
require 'multi_json'
require 'uri'
require 'octokit'

module Rubygems
  module CodeFinder
    extend self
    class RubygemsNotFound < StandardError; end
    class RepositoryNotFound < StandardError; end

    def url(name, options = {})
      conn = Faraday.new 'https://rubygems.org'
      response = conn.get('/api/v1/gems/' + name + '.json')
      fail RubygemsNotFound unless response.status == 200
      begin
        parse_response_body(response.body)
      rescue RepositoryNotFound
        search_github(name)
      end
    end

    def parse_response_body(body)
      data = MultiJson.load(body)
      return data['source_code_uri'] if data['source_code_uri'] && URI.parse(data['source_code_uri']).host == 'github.com'
      return data['homepage_uri'] if data['homepage_uri'] && URI.parse(data['homepage_uri']).host == 'github.com'
      fail RepositoryNotFound
    end

    def search_github(name)
      res = Octokit.search_repositories name
      return 'https://github.com/' + res.items.first.full_name if res.items.count >= 1
      fail RepositoryNotFound
    end
  end
end
