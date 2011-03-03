module I18nSerializer
  def self.included klass
    klass.extend ClassMethods
  end
  
  module ClassMethods
    def i18n_serialize *columns
      columns.each do |column|
        serialize column
        singularized = column.to_s.singularize
        
        #current locale getter
        define_method singularized do
          i18n_content = self[column]
          i18n_content[I18n.locale] || i18n_content[I18n.default_locale]
        end
        #current locale setter
        define_method "#{singularized}=" do |localized_value|
          self[column] ||= {}
          self[column][I18n.locale] = localized_value
        end
        
        #define a getter and setter for each locale
        I18n.available_locales.each do |locale|
          define_method "#{singularized}_#{locale}" do
            self[column][locale.to_s]
          end
          define_method "#{singularized}_#{locale}=" do |localized_value|
            self[column] ||= {}
            self[column][locale.to_s] = localized_value
          end
        end
      end
    end
  end
end