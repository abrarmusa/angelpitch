class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy, :sharedeck, :deckshared]
  layout 'vcdash'
  before_action :authenticate_user!
  # GET /decks
  # GET /decks.json



  def new
    @person = Individual.find_by(id: current_user.meta_id)
    @deck = @person.decks.new
    respond_to do |format|
      format.js
    end

  end

  # GET /decks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def sharedeck
    @shared_deck = @person.shared_decks.new
    @individual = Individual.find_by(id: current_user.meta_id)
    @investors = Investor.all
    respond_to do |format|
      format.js
    end
  end

  def deckshared
    @shareddeck = @person.shared_decks.new(sharedeck_params)
    @shareddeck.deck_id = @deck.id
    respond_to do |format|
      if @shareddeck.save
        format.js
      else
        Rails.logger.info "FAILEDFAILEDFAILEDFAILEDFAILEDFAILEDFAILEDFAILED"
      end
    end
  end

  # POST /decks
  # POST /decks.json
  def create
    @person = Individual.find_by(id: current_user.meta_id)
    Rails.logger.info ">>>>>>>>>>>>>>>>>>> #{@person.id} <<<<<<<<<<<<<<<<<<"
    @deck = @person.decks.new(deck_params)
    @deck.individual = Individual.find_by(id: current_user.meta_id)
    @decks = @person.decks.all
    respond_to do |format|
      if @deck.save
        format.js
      else
        Rails.logger.info "FAILEDFAILEDFAILEDFAILEDFAILEDFAILEDFAILEDFAILED"
      end
    end
  end

  # PATCH/PUT /decks/1
  # PATCH/PUT /decks/1.json
  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.js
      else
        format.js { render :edit }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    if @deck.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @person = Individual.find_by(id: current_user.meta_id)
      @decks = @person.decks.all
      @deck = @decks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:title, :description, :amount, :pitch, :logo)
    end

    def sharedeck_params
      params.require(:shared_deck).permit(:investor_id)
    end
end
