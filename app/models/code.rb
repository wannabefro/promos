class Code < ActiveRecord::Base
  include Tokenable
  belongs_to :promotion
  has_many :redemptions

  enum status: [ :pending, :active, :redeemed ]

  TYPES = %w(unique single)
  
  validates_presence_of :promotion, :quantity, :status, :unique

  def redeem(ip)
    Redemption.new do |red|
      red.code = self
      red.ip_address = ip
      if red.save
        self.redeemed!
      else
        return false
      end
    end
  end
end
