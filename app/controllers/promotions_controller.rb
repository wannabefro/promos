class PromotionsController < ApplicationController
  before_action :user_signed_in?

  def new
    @promotion = Promotion.new
    @attachment = @promotion.attachments.build
  end

  def create

  end
end
