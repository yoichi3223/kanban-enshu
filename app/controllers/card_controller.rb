class CardController < ApplicationController
  before_action :set_card,only: %i(show edit update destroy)

  def new
    @list = List.find_by(params[:list_id])
    @card = Card.new
  end

  def show
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
    @lists = List.where(user_id: current_user.id)
  end
  
  def update
    if @card.update(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
  @card.destroy
  redirect_to :root
  end



  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title,:memo,:list_id)
  end

end
