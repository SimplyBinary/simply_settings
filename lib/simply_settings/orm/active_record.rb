module SimplySettings

  private

  def update(setting, value)
    record = find(setting)
    record.value = value
    record.save
  end

  def remove(record)
    record.destroy if record.present?
  end

  def insert(setting, value)
    Record.create(setting: setting, value: value)
  end

  def find(setting)
    Record.where(setting: setting).first
  end

  def list_settings_in_order
    Record.order(:setting).pluck(:setting)
  end

  class JSONWithIndifferentAccessForHashes
    def self.load(str)
      obj = JSON.load(str)
      obj = HashWithIndifferentAccess.new(obj) if obj.is_a? Hash
      obj
    end

    def self.dump(obj)
      JSON.dump(obj)
    end
  end

  class Record < ActiveRecord::Base
    self.table_name = "simply_settings"

    serialize :value, JSONWithIndifferentAccessForHashes
  end
end
