class PromotionsController < ApplicationController
  before_action :user_signed_in?, except: [:redeem]

  def index
    @promotions = current_user.promotions
  end

  def new
    @promotion = Promotion.new
    @attachment = @promotion.attachments.build
  end

  def create
    @promotion = Promotion.new(promotion_params)
    @promotion.user = current_user
    @promotion.status = 'active'
    if @promotion.save
      params[:attachments][:attachment].each do |a|
        @attachment = @promotion.attachments.create!(attachment: a)
      end
      begin
        CodeGenerator.new(params[:promotion][:code_unique][0], params[:promotion][:code_quantity], @promotion).generate
        redirect_to promotion_path(@promotion), notice: 'Successfully created promotion'
      rescue
        render :new
      end
    else
      render :new
    end
  end

  def show
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
