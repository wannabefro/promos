class Card < ActiveRecord::Base
  before_validation :set_default_values, on: [:create]
  belongs_to :promotion

  validates_presence_of :header_color, :content_color, :header_text, :content_text, :promotion
  validates_length_of :header_text, maximum: 30
  validates_length_of :content_text, maximum: 50

  private

  def set_default_values
    self.header_color = "#2C3E50"
    self.content_color = "#E74C3C"
    self.header_text = promotion.name
    self.content_text = "Enjoy!!"
  end
end
