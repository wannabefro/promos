class PromotionsController < ApplicationController
  before_action :user_signed_in?, except: [:redeem]

  def index
    @promotions = current_user.promotions
  end

  def new
    @promotion = params[:promotion] ? Promotion.new(promotion_params) : Promotion.new
    @attachment = @promotion.attachments.build
  end

  def create
    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    @promotion.status = 'active'
    Promotion.transaction do
      @promotion.save
      begin
        params[:attachments][:attachment].each do |a|
          @attachment = @promotion.attachments.create!(attachment: a)
        end
        CodeGenerator.new(params[:promotion][:code_unique], params[:promotion][:code_quantity], @promotion).generate
        redirect_to promotion_path(@promotion), notice: 'Successfully created promotion'
      rescue
        @_errors = true
        redirect_to new_promotion_path({promotion: promotion_params}), alert: 'Sorry something went wrong. Please try again'
      end
      raise ActiveRecord::Rollback if @_errors
    end
  end

  def show
    @promotion = Promotion.find(params[:id])
    locations = @promotion.redemptions.pluck(:location)
    @locations = Location.map_information(locations).to_json
    @dates = Location.date_information(@promotion.redemptions).to_json
  end

  def print
    @promotion = Promotion.find(params[:id])
  end

  def redeem
    @code = Code.where(token: params[:token]).take
    if @code.active?
      if @code.redeem(request.remote_ip)
        @promotion = @code.promotion
      end
    else
      redirect_to root_path, notice: 'Sorry that code has already been used'
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:code_quantity, :name, :message, attachment_attributes: [:attachment])
  end
end
