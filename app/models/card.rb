class Card < ActiveRecord::Base
  before_validation :set_default_values, only: [:create]
  belongs_to :code

  validates_presence_of :header_color, :content_color, :header_text, :content_text, :code
  validates_length_of :header_text, maximum: 30
  validates_length_of :content_text, maximum: 50

  private

  def set_default_values
    self.header_color = "#2C3E50"
    self.content_color = "#E74C3C"
    self.header_text = code.promotion.name
    self.content_text = "Your code is #{code.token}"
  end
end