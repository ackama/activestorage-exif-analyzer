# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ['--parallel']
end

RSpec::Core::RakeTask.new(:spec)

task default: %i[rubocop spec]
