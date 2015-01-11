class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
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
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deck_params
      params.require(:deck).permit(:title, :description, :amount, :pitch, :logo)
    end
end
