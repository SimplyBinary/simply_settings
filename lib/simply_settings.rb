module SimplySettings
  class Settings    
    include Singleton

    def method_missing(method_name, *args, &block)
      method_name = method_name.to_s
      if method_name.ends_with?("=")
        method_name.chomp!("=")
        value = args.first
        set(method_name, value)
      else
        get(method_name)
      end
    end

    def delete(setting)
      record = find(setting)
      record.destroy if record.present?
    end

    def exists?(setting)
      find(setting).present?
    end

    private

    def set(setting, value)
      record = find(setting)
      if value.nil?
        delete(setting)
      elsif record.present?
        record.value = value
        record.save
      else
        Record.create(setting: setting, value: value)
      end
    end

    def get(setting)
      record = find(setting)
      record.value if record.present?
    end

    def find(setting)
      Record.where(setting: setting).first
    end

  end

  class Record < ActiveRecord::Base
    self.table_name = "simply_settings"
  end
end
