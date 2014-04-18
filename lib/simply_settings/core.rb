module SimplySettings
  extend self

  def method_missing(method_name, *args, &block)
    value = args.first
    if method_name.to_s =~ /(.*)=/
      define_methods($1, value)
      send(method_name, value)
    else
      define_getter(method_name)
      send(method_name)
    end
  end

  def delete(setting)
    record = find(setting)
    remove(record)
    undef_methods(setting)
  end

  def exists?(setting)
    find(setting).present?
  end

  def settings
    list_settings_in_order
  end

  def setup
    yield self
  end

  private

  def set(setting, value)
    return delete(setting) if value.nil?
    return update(setting, value) if exists?(setting)
    return insert(setting, value)
  end

  def get(setting)
    setting = setting.to_s.chomp("?")
    record = cached_find(setting)
    record.value if record.present?
  end

  def define_setter(setting, value)
    define_method(setting) do |value|
      set(setting.to_s.chomp("="), value)
    end
  end

  def define_getter(setting)
    define_method(setting) do
      get(setting)
    end
  end

  def define_and_call_setter(setting, value)
    define_setter(setting, value) unless respond_to?("#{setting}=")
    send("#{setting}=", value)
  end

  def define_and_call_getter(setting)
    define_getter(setting) unless respond_to?(setting)
    send(setting)
  end

  def define_methods(setting, value)
    define_setter("#{setting}=", value)
    define_getter(setting)
  end

  def undef_methods(setting)
    undef_method(setting) if respond_to?(setting)
    undef_method(:"#{setting}?") if respond_to?(:"#{setting}?")
    undef_method(:"#{setting}=") if respond_to?(:"#{setting}=")
  end

end
