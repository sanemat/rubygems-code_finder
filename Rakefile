require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec') do |spec|
  spec.rspec_opts = %w(--color --format documentation --warnings --require spec_helper)
end
task default: :spec
