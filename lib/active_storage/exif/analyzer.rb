# frozen_string_literal: true

require 'active_storage'
require 'active_storage/analyzer/image_analyzer'

module ActiveStorage
  module Exif
    ##
    # Uses MiniMagick to extract EXIF metadata from an image file.
    # By extending ImageAnalyzer, all the error handling is done
    # for us.
    class Analyzer < ActiveStorage::Analyzer::ImageAnalyzer
      def metadata
        { exif: read_image(&:exif) }
      end
    end
  end
end

require 'active_storage/exif/railtie' if defined?(Rails)
