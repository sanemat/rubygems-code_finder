require_relative '../../spec_helper'
require 'byebug'

describe Rubygems::CodeFinder do
  it 'returns source_code_uri' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/tachikoma.json').
      to_return(status: 200, body: File.new('./spec/fixtures/tachikoma.json'), headers: {})

    expect(Rubygems::CodeFinder.url('tachikoma')).to eq 'https://github.com/sanemat/tachikoma'
  end
end
