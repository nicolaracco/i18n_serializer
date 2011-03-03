require 'rubygems'
require 'active_record'
require 'i18n'

I18n.available_locales = %w{en it} #set available locales during testing


plugin_dir = File.dirname(File.dirname __FILE__)
require File.join(plugin_dir, 'rails', 'init')

databases = YAML::load(IO.read(File.join plugin_dir, 'config', 'database.yml'))
ActiveRecord::Base.establish_connection(databases)
load(File.join plugin_dir, 'db', 'schema.rb')