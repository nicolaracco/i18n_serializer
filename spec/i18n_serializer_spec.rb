require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), 'models', 'topic')

describe I18nSerializer do
  before :all do
    @languages            = I18n.available_locales
    @column               = 'descriptions'
    @singularized         = @column.singularize
    @avail_locale_helpers = @languages.map { |lang| "#{@singularized}_#{lang}" }
  end
  
  describe 'Testing definition' do
    let(:topic) { Topic.new }

    it 'should have a mocked model' do
      Topic.column_names.should include(@column)
    end
  
    it 'should have a getter for the current locale' do
      topic.should respond_to(@singularized)
    end
  
    it 'should have a setter for the current locale' do
      topic.should respond_to("#{@singularized}=")
    end
  
    it 'should have a getter for each available locale' do
      @avail_locale_helpers.each do |helper|
        topic.should respond_to(helper)
      end
    end

    it 'should have a setter for each available locale' do
      @avail_locale_helpers.each do |helper|
        topic.should respond_to("#{helper}=")
      end
    end
  end
  
  describe 'Testing locale assignemnts' do
    let(:topic) { Topic.new }
    
    it 'should set a value with default locale' do
      topic.description = 'MyTestString'
    end
    
    it 'should match the value setted with default locale' do
      test_string               = 'My Test String'
      topic.description         = test_string
      topic.description.should == test_string
    end
    
    it 'should set a value with a certain locale' do
      topic.description_it = 'Mia stringa di test'
    end
    
    it 'should match the value setted with a certain locale' do
      test_string                   = 'Mia stringa di test'
      topic.description_it          = test_string
      topic.description_it.should  == test_string
    end
    
    it 'should not match the value setted with another locale' do
      test_string_en, test_string_it    = 'My Test String', 'Mia stringa di test'
      topic.description_it              = test_string_it
      topic.description_en              = test_string_en
      topic.description_it.should_not  == test_string_en
    end
  end
  
  describe 'Testing store/retrieve procedures' do
    it 'should save correctly a localized field' do
      topic = Topic.new
      topic.description_it = 'Test String'
      lambda do
        topic.save!
      end.should_not raise_error
    end
    
    it 'should retrieve the setted value correctly' do
      topic = Topic.all.first
      topic.description_it.should == 'Test String'
    end
    
    it 'should have an unsetted value as nil' do
      topic = Topic.all.first
      topic.description_en.should == nil
    end
  end
end