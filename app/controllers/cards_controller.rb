class CardsController < ApplicationController
  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      redirect_to print_promotion_path(@card.promotion), notice: 'Updated card'
    else
      render Rails.application.routes.recognize_path(request.referer)[:action]
    end
  end

  private

  def card_params
    params.require(:card).permit(:header_text, :content_text, :header_color, :content_color)
  end
end
