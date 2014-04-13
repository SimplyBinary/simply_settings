module SimplySettings

  def fetch(setting, &block)
    value = get(setting)
    return value unless value.nil?
    value = yield if block_given?
    set(setting, value)
    value
  end

  def []=(setting, value)
    set(setting, value)
  end

  def [](setting)
    get(setting)
  end
  
end
