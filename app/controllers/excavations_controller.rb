class ExcavationsController < ApplicationController
  layout 'page'
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_excavation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @excavations = Excavation.all
    @hash = Gmaps4rails.build_markers(@excavations) do |excavation, marker|
      marker.lat excavation.latitude
      marker.lng excavation.longitude
      marker.title excavation.name
      marker.infowindow "<a href='#{url_for(excavation)}'>#{excavation.name}</a>"
    end
    respond_with(@excavations)
  end

  def show
    @hash = Gmaps4rails.build_markers(@excavation) do |excavation, marker|
      marker.lat excavation.latitude
      marker.lng excavation.longitude
      marker.title excavation.name
    end
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
      params.require(:excavation).permit(:name, :dai_gazetter_id, :shortcut, :creator, :updater, :address, :latitude, :longitude)
    end
end
