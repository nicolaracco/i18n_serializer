# encoding: utf-8
require 'rubygems'
require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "i18n_serializer"
    gem.summary = %Q{I18n with serialize helper}
    gem.email = "nicola@nicolaracco.com"
    gem.authors = ["Nicola Racco"]
    gem.add_dependency "rails", '>= 3.0.5'
    gem.add_development_dependency "rspec", ">= 2.5.0"
    gem.add_development_dependency "sqlite3", ">= 1.3.3"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


desc "Run all examples"
Rspec::Core::RakeTask.new(:spec)

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "i18n_serializer #{version}"
  #rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end