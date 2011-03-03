require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), 'cases', 'topic')
require File.join(File.dirname(File.dirname __FILE__), 'lib', 'i18n_serializer')

describe I18nSerializer do
  before :each do
    @languages  = %w{en it}
    @column     = 'descriptions'
    @avail_locale_getters = @languages.map { |lang| "#{@column}_#{lang}" }
  end
  
  it 'should have a mocked model' do
    Topic.column_names.should include(@column)
  end
  
  it 'should have a field for the current locale' do
    Topic.public_methods.should include(@column.singularize)
  end
  
  it 'should have a field for each available locale' do
    Topic.public_methods.should include(*@avail_locale_getters)
  end
end