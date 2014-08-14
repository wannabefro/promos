class Code < ActiveRecord::Base
  include Tokenable
  belongs_to :promotion

  enum status: [ :pending, :active ]

  TYPES = %w(unique single)
  
  validates_presence_of :promotion, :quantity, :status, :unique
end
