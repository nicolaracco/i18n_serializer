require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), 'cases', 'topic')

describe I18nSerializer do
  before :all do
    @languages            = I18n.available_locales
    @column               = 'descriptions'
    @singularized         = @column.singularize
    @avail_locale_getters = @languages.map { |lang| "#{@singularized}_#{lang}" }
  end
  
  it 'should have a mocked model' do
    Topic.column_names.should include(@column)
  end
  
  it 'should have a getter for the current locale' do
    Topic.new.should respond_to(@singularized)
  end
  
  it 'should have a field for each available locale' do
    @avail_locale_getters.each do |getter|
      Topic.new.should respond_to(getter)
    end
  end

end