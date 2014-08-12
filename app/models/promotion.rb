class Promotion < ActiveRecord::Base
  belongs_to :user

  has_many :attachments, as: :attachable
  accepts_nested_attributes_for :attachments
  
  enum status: [ :pending ]

  validates_presence_of :user, :name
end
