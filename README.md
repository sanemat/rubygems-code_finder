# Rubygems::CodeFinder

[![Gem Version](https://badge.fury.io/rb/rubygems-code_finder.png)](http://badge.fury.io/rb/rubygems-code_finder)
[![Build Status](https://api.travis-ci.org/sanemat/rubygems-code_finder.png?branch=master)](https://travis-ci.org/sanemat/rubygems-code_finder)
[![Code Climate](https://codeclimate.com/github/sanemat/rubygems-code_finder.png)](https://codeclimate.com/github/sanemat/rubygems-code_finder)
[![Coverage Status](https://coveralls.io/repos/sanemat/rubygems-code_finder/badge.png?branch=master)](https://coveralls.io/r/sanemat/rubygems-code_finder)

## Installation

Add this line to your application's Gemfile:

    gem 'rubygems-code_finder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubygems-code_finder

## Usage

```irb
irb(main):001:0> require 'rubygems-code_finder'
=> true
irb(main):002:0> Rubygems::CodeFinder.url 'tachikoma'
=> "https://github.com/sanemat/tachikoma"
irb(main):003:0> Rubygems::CodeFinder.url 'invalid'
Rubygems::CodeFinder::RubygemsNotFound: Rubygems::CodeFinder::RubygemsNotFound
        from /Users/sane/.anyenv/envs/rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/bundler/gems/rubygems-code_finder-9fdb9327350d/lib/rubygems-code_finder.rb:15:in `url'
        from (irb):3
        from /Users/sane/.anyenv/envs/rbenv/versions/2.1.0/bin/irb:11:in `<main>'
irb(main):004:0> Rubygems::CodeFinder.url 'mm-devise'
=> "http://github.com/kristianmandrup/mm-devise"
irb(main):005:0> Rubygems::CodeFinder.url 'fluentd'
Rubygems::CodeFinder::RepositoryNotFound: Rubygems::CodeFinder::RepositoryNotFound
        from /Users/sane/.anyenv/envs/rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/bundler/gems/rubygems-code_finder-9fdb9327350d/lib/rubygems-code_finder.rb:23:in `parse_response_body'
        from /Users/sane/.anyenv/envs/rbenv/versions/2.1.0/lib/ruby/gems/2.1.0/bundler/gems/rubygems-code_finder-9fdb9327350d/lib/rubygems-code_finder.rb:16:in `url'
        from (irb):5
        from /Users/sane/.anyenv/envs/rbenv/versions/2.1.0/bin/irb:11:in `<main>'
```

## Contributing

1. Fork it ( https://github.com/sanemat/rubygems-code_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
