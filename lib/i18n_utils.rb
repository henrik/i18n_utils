require "i18n_utils/version"

# For html_safe/SafeBuffer.
require "active_support/all"

module I18nUtils
  module Model
    def t_attribute(klass, attribute)
      klass.human_attribute_name(attribute)
    end

    def t_model(klass)
      klass.model_name.human
    end
  end

  module Scope
    def t_scope(key)
      base_key = key.to_s.rpartition(".").first
      scope = ScopeContext.new(base_key, self)
      yield(scope)
      t(key, scope.to_hash).html_safe
    end
  end

  module Helper
    include Model
    include Scope
  end

  extend Model

  class ScopeContext
    def initialize(base_key, helper)
      @base_key = base_key
      @helper = helper
      @hash = {}
    end

    def to_hash
      @hash
    end

    def t(key, opts = {})
      @helper.t("#{@base_key}.#{key}", opts)
    end

    def method_missing(name, *args, &block)
      html = @helper.capture(&block)
      @hash[name] = html
    end
  end
end
