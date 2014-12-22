class IndividualsController < ApplicationController
  before_action :set_individual, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @individuals = Individual.all
    respond_with(@individuals)
  end

  def show
    respond_with(@individual)
  end

  def new
    @individual = Individual.new
    respond_with(@individual)
  end

  def edit
  end

  def create
    @individual = Individual.new(individual_params)
    @individual.save
    respond_with(@individual)
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
      params.require(:individual).permit(:name, :email, user_attributes: [ :id, :email, :name, :password ])
    end
end
