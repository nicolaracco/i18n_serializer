require 'rubygems'
require 'active_record'
require 'i18n'

I18n.available_locales = %w{en it} #set available locales during testing


spec_dir = File.dirname(__FILE__)
plugin_dir = "#{spec_dir}/../"
require File.join(plugin_dir, 'rails', 'init')

databases = YAML::load(IO.read(File.join spec_dir, 'config', 'database.yml'))
ActiveRecord::Base.establish_connection(databases)
load(File.join spec_dir, 'db', 'schema.rb')