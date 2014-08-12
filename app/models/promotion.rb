class Promotion < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  belongs_to :user

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments

  TOTAL_ATTACHMENT_FILE_SIZE = 20
  
  enum status: [ :pending, :active ]

  validates_presence_of :user, :name
end
