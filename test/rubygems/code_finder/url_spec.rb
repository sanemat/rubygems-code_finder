require_relative '../../spec_helper'
require 'byebug'

describe Rubygems::CodeFinder do
  it '' do
    Rubygems::CodeFinder.url('tachikoma')
    fail
  end
end
