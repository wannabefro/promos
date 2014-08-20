class Promotion < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  attr_accessor :code_quantity, :code_unique

  belongs_to :user

  has_many :attachments, as: :attachable
  has_many :codes, dependent: :destroy
  has_many :redemptions, through: :codes

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :codes

  TOTAL_ATTACHMENT_FILE_SIZE = 20
  
  enum status: [ :pending, :active ]

  validates_presence_of :user, :name
  validates_length_of :message, maximum: 500

  validates :code_quantity, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }

  def active_codes
    codes.where(status: 1)
  end

  def code_quantity
    @code_quantity.to_i
  end

end
