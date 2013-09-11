require "i18n_utils/version"

module I18nUtils
  module Helpers
    def t_attribute(klass, attribute)
      klass.human_attribute_name(attribute)
    end

    def t_model(klass)
      klass.model_name.human
    end
  end

  extend Helpers
end
