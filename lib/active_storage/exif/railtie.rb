module ActiveStorage
  module Exif
    class Railtie < Rails::Railtie
      config.active_storage.analyzers.prepend ActiveStorage::Exif::Analyzer
    end
  end
end

