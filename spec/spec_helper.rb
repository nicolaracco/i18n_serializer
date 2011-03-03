require 'rubygems'
require 'active_record'

plugin_spec_dir = File.dirname(File.dirname __FILE__)

databases = YAML::load(IO.read(File.join plugin_spec_dir, 'config', 'database.yml'))
ActiveRecord::Base.establish_connection(databases)
load(File.join plugin_spec_dir, 'db', 'schema.rb')