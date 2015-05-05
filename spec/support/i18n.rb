module I18nHelper
  def t(key, options = {})
    ::I18n.translate(key, options)
  end
end

RSpec.configure do |config|
  config.include I18nHelper
end
