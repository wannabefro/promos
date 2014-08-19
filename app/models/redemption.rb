class Redemption < ActiveRecord::Base
  include Locationable

  belongs_to :code

  validates :ip_address, presence: true
  validates :code, presence: true
  validates :ip_address, uniqueness: { scope: :code_id }
end
