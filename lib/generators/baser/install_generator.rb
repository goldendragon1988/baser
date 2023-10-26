# frozen_string_literal: true

module Baser
  # Execute generator to create file on initializer
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __dir__)
    desc "This generator creates an baser.rb file at config/initializers"
    def copy_initializer_file
      copy_file "baser.rb", "config/initializers/baser.rb"
    end
  end
end
