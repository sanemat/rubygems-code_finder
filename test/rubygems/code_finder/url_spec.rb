require_relative '../../spec_helper'
require 'byebug'

describe Rubygems::CodeFinder do
  it '' do
    expect(Rubygems::CodeFinder.url('tachikoma')).to eq 'https://github.com/sanemat/tachikoma'
  end
end
