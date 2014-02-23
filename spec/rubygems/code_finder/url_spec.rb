require 'byebug' if RUBY_VERSION >= '2'

describe Rubygems::CodeFinder do
  it 'returns source_code_uri' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/tachikoma.json').
      to_return(status: 200, body: File.new('./spec/fixtures/tachikoma.json'), headers: {})

    expect(Rubygems::CodeFinder.url('tachikoma')).to eq 'https://github.com/sanemat/tachikoma'
  end

  it 'fails gem not found' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/invalid.json').
      to_return(status: 404, body: '', headers: {})
    expect { Rubygems::CodeFinder.url('invalid') }.to raise_error(Rubygems::CodeFinder::RubygemsNotFound)
  end

  it 'returns homepage_uri' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/mm-devise.json').
      to_return(status: 200, body: File.new('./spec/fixtures/mm-devise.json'), headers: {})

    expect(Rubygems::CodeFinder.url('mm-devise')).to eq 'http://github.com/kristianmandrup/mm-devise'
  end

  it 'returns github search response' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/fluentd.json').
      to_return(status: 200, body: File.new('./spec/fixtures/fluentd.json'), headers: {})
    stub_request(:get, 'https://api.github.com/search/repositories?q=fluentd').
      to_return(status: 200, body: File.new('./spec/fixtures/repositories?q=fluentd'), headers: { content_type: 'application/json; charset=utf-8' })

    expect(Rubygems::CodeFinder.url('fluentd')).to eq 'https://github.com/fluent/fluentd'
  end

  it 'fails repository not found' do
    stub_request(:get, 'https://rubygems.org/api/v1/gems/fluentd.json').
      to_return(status: 200, body: File.new('./spec/fixtures/fluentd.json'), headers: {})
    stub_request(:get, 'https://api.github.com/search/repositories?q=fluentd').
      to_return(status: 200, body: File.new('./spec/fixtures/repositories?q=reposnotfound'), headers: { content_type: 'application/json; charset=utf-8' })

    expect { Rubygems::CodeFinder.url('fluentd') }.to raise_error(Rubygems::CodeFinder::RepositoryNotFound)
  end
end
