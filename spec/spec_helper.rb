plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(File.join plugin_spec_dir, 'debug.log')

databases = YAML::load(IO.read(File.join plugin_spec_dir, 'config', 'database.yml'))
ActiveRecord::Base.establish_connection(databases[ENV['DB']] || 'sqlite3')
load(File.join plugin_spec_dir, 'db', 'schema.rb')