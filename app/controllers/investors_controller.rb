class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @investors = Investor.all
    respond_with(@investors)
  end

  def show
    respond_with(@investor)
  end

  def new
    @investor = Investor.new
    respond_with(@investor)
  end

  def edit
  end

  def create
    @investor = Investor.new(investor_params)
    @investor.save
    respond_with(@investor)
  end

  def update
    @investor.update(investor_params)
    respond_with(@investor)
  end

  def destroy
    @investor.destroy
    respond_with(@investor)
  end

  private
    def set_investor
      @investor = Investor.find(params[:id])
    end

    def investor_params
      params.require(:investor).permit(:name, :avatar, user_attributes: [ :id, :email, :name, :password ])
    end
end
