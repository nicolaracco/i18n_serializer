require File.join(File.dirname(File.dirname __FILE__), 'lib', 'i18n_serializer')
ActiveRecord::Base.send :include, I18nSerializer