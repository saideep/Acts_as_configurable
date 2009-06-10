class ActsAsConfigurableGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      # m.directory "lib"
      # m.template 'README', "README"
      m.migration_template 'create_configurations.rb', 'db/migrate', {:migration_file_name => "acts_as_configurable"}
    end
  end
end
