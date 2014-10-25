class ArtefactsController < ApplicationController
  layout 'page'
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_artefact, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @artefacts = Artefact.all
    respond_with(@artefacts)
  end

  def show
    respond_with(@artefact)
  end

  def new
    @artefact = Artefact.new
    @artefact.artefact_identificators.build
    respond_with(@artefact)
  end

  def edit
  end

  def create
    @artefact = Artefact.new(artefact_params.merge(creator: current_user, updater: current_user))
    flash[:notice] = 'Artefact was successfully created.' if @artefact.save
    respond_with(@artefact)
  end

  def update
    flash[:notice] = 'Artefact was successfully updated.' if @artefact.update(artefact_params.merge(updater: current_user))
    respond_with(@artefact)
  end

  def destroy
    @artefact.destroy
    respond_with(@artefact)
  end

  private
    def set_artefact
      @artefact = Artefact.find(params[:id])
    end

    def artefact_params
      params.require(:artefact).permit(:dimensions, :dimensions_type, :weight, :dez, :dez_index, 
        :in_exhibition, artefact_identificators_attributes: [:id, :artefact_id, :name, :fjno, :excavation_id, :_destroy], 
        comments_attributes: [:id, :content, :language, :_destroy], restorations_attributes: [:id, :date_of_action, :_destroy],
        dispositions_attributes: [:id, :receipt_date, :_destroy], specifications_attributes: [:id, :vocabulary_id, :_destroy])
    end
end
