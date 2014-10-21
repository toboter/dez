class ExcavationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_excavation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @excavations = Excavation.all
    respond_with(@excavations)
  end

  def show
    respond_with(@excavation)
  end

  def new
    @excavation = Excavation.new
    respond_with(@excavation)
  end

  def edit
  end

  def create
    @excavation = Excavation.new(excavation_params.merge(creator: current_user, updater: current_user))
    flash[:notice] = 'Excavation was successfully created.' if @excavation.save
    respond_with(@excavation)
  end

  def update
    flash[:notice] = 'Excavation was successfully updated.' if @excavation.update(excavation_params.merge(updater: current_user))
    respond_with(@excavation)
  end

  def destroy
    @excavation.destroy
    respond_with(@excavation)
  end

  private
    def set_excavation
      @excavation = Excavation.find(params[:id])
    end

    def excavation_params
      params.require(:excavation).permit(:name, :dai_gazetter_id, :shortcut)
    end
end
