# frozen_string_literal: true

module ActiveStorage
  module Exif
    ##
    # Adds the EXIF analyser to the list of ActiveStorage analyzers
    # when the Rails app is configured
    class Railtie < Rails::Railtie
      config.active_storage.analyzers.prepend ActiveStorage::Exif::Analyzer
    end
  end
end
