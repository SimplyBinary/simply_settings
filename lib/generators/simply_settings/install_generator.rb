require 'rails/generators'
require 'rails/generators/active_record'

module SimplySettings
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    source_root File.expand_path('../templates', __FILE__)

    desc 'Generates (but does not run) a migration to add a simply_settings table.'

    def create_migration_file
      migration_template 'create_simply_settings.rb', 'db/migrate/create_simply_settings.rb'
    end

    def copy_initializer
      template "simply_settings.rb", "config/initializers/simply_settings.rb"
    end

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end
  end
end