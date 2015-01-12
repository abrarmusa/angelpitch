class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:new, :create]
  before_filter :check_privileges!, except:[:new, :create]
  layout "vcdash"

  def index
    @person = Investor.find_by(id: current_user.meta_id)
    @deck_ids = SharedDeck.where(investor_id: @person.id).map(&:deck_id)
    @decks = Deck.where(id: @deck_ids)
    Rails.logger.info ">>>>>>>>>>>>>>>>> #{@decks.each do |a| a.title end} <<<<<<<<<<<<<<<<<<<<"
  end

  def show
    respond_with(@investor)
  end

  def new
    @investor = Investor.new
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)
    respond_to do |format|
      if @investor.save
        format.html {redirect_to new_user_session_path }
      else
        flash[:notice] = "Please fix errors"
      end
    end
  end

  def update
    @investor.update(investor_params)
    respond_with(@investor)
  end

  def destroy
    @investor.destroy
    respond_with(@investor)
  end


  def check_privileges!
    redirect_to individuals_path, notice: 'You dont have enough permissions to be here' unless current_user.meta_type == "Investor"
  end


  private

    def set_investor
      @investor = Investor.find(params[:id])
    end

    def investor_params
      params.require(:investor).permit(:name, :avatar, user_attributes: [ :id, :email, :name, :password ])
    end

end
