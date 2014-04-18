module SimplySettings

  def fetch(setting, &block)
    value = get(setting)
    return value unless value.nil?
    value = yield if block_given?
    define_and_call_setter(setting, value)
    value
  end

  def []=(setting, value)
    define_and_call_setter(setting, value)
  end

  def [](setting)
    define_and_call_getter(setting)
  end
  
end
