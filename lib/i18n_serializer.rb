module I18nSerializer
  def self.included klass
    klass.extend ClassMethods
  end
  
  module ClassMethods
    def i18n_serialize *columns
      columns.each do |column|
        singularized = column.to_s.singularize
        
        #current locale getter
        define_method singularized do
          i18n_content = self[column]
          i18n_content[I18n.locale] || i18n_content[I18n.default_locale]
        end
        #define a getter for each locale
        I18n.available_locales.each do |locale|
          define_method "#{singularized}_#{locale}" do
            self[column][locale]
          end
        end
      end
    end
  end
end