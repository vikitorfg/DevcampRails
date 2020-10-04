class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  scope :pythondjango, -> { where(subtitle: 'Python Django') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'https://baconmockup.com/600/400/'
    self.thumb_image ||= 'https://baconmockup.com/300/200/'
  end
end
