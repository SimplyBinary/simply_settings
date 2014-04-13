module SimplySettings
  extend self

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /(.*)=/
      value = args.first
      set($1, value)
    else
      get(method_name)
    end
  end

  def delete(setting)
    record = find(setting)
    remove(record)
  end

  def exists?(setting)
    find(setting).present?
  end

  def settings
    list_settings_in_order
  end

  private

  def set(setting, value)
    return delete(setting) if value.nil?
    return update(setting, value) if exists?(setting)
    return insert(setting, value)
  end

  def get(setting)
    setting = setting.to_s.chomp("?")
    record = find(setting)
    record.value if record.present?
  end

end
