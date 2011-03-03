# encoding: utf-8
require 'rubygems'
require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = 'i18n_serializer'
    gem.version     = '1.0.0'
    gem.summary     = %Q{I18n with serialize helper}
    gem.description = %Q{Provides some helpers to simplify the use of serialization to manage database i18n management}
    gem.email       = 'nicola@nicolaracco.com'
    gem.homepage    = 'http://github.com/nicolaracco/i18n_serializer.git'
    gem.authors     = [ 'Nicola Racco' ]
    gem.add_dependency 'activerecord', '>= 2.3.8'
    gem.add_development_dependency 'rspec',   '>= 2.5.0'
    gem.add_development_dependency 'sqlite3', '>= 1.3.3'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler (or a dependency) not available. Install it with: gem install jeweler'
end

task :default => :spec

desc 'Run the specs'
Rspec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--colour --format progress']
end