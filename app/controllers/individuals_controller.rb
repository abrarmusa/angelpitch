class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:new, :create]
  before_filter :check_privileges!, only:[:index]

  layout "indidash"

  def index
    @person = Individual.find_by(id: current_user.meta_id)
    Rails.logger.info ">>>>>>>>>>>>>>>>> #{@person} <<<<<<<<<<<<<<<<<<<<"
    @decks = @person.decks.all
  end

  def show
    respond_with(@individual)
  end

  def new
    @individual = Individual.new
    respond_to do |format|
      format.js
    end
  end

  def edit
  end


  def create
    @individual = Individual.new(individual_params)
    respond_to do |format|
      if @individual.save
        format.html {redirect_to new_user_session_path }
      else
        flash[:notice] = "Please fix errors"
      end
    end
  end

  def update
    @individual.update(individual_params)
    respond_with(@individual)
  end

  def destroy
    @individual.destroy
    respond_with(@individual)
  end

  private

    def set_individual
      @individual = Individual.find(params[:id])
    end

    def individual_params
      params.require(:individual).permit(:name, :avatar, user_attributes: [ :id, :email, :name, :password ])
    end

    def check_privileges!
      redirect_to investors_path, notice: 'You dont have enough permissions to be here' unless current_user.meta_type == "Individual"
    end

end
