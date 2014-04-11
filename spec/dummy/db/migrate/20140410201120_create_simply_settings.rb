class CreateSimplySettings < ActiveRecord::Migration
  def change
    create_table :simply_settings do |t|
      t.string :setting
      t.text :value
      t.timestamps
    end
  end
end