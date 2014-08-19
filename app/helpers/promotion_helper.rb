module PromotionHelper
  def redeemed(codes)
    "#{codes.where(status: 2).count}/#{codes.count}"
  end
end
