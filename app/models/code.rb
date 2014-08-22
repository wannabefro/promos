class Code < ActiveRecord::Base
  include Tokenable
  belongs_to :promotion
  has_many :redemptions
  has_one :card

  enum status: { pending: 0, active: 1, redeemed: 2 }

  TYPES = %w(unique single)
  
  validates_presence_of :promotion, :quantity, :status
  validates_inclusion_of :unique, :in => [true, false]

  def redeem(ip)
    Redemption.new do |red|
      red.code = self
      red.ip_address = ip
      if red.save
        code_used
      else
        return false
      end
    end
  end

  private

  def code_used
    if unique
      self.redeemed!
    else
      self.quantity -= 1
      if self.quantity <= 0
        self.redeemed!
      else
        self.save!
      end
    end
  end
end
