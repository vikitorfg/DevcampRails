module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://baconmockup.com/#{height}/#{width}/"
  end
end
