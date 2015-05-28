class VocabulariesController < ApplicationController
  layout 'page'
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_vocabulary, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vocabularies = Vocabulary.all
    respond_with(@vocabularies)
  end

  def show
    @artefacts = @vocabulary.self_and_descendants.map{ |v| v.artefacts }.flatten.sort_by { |i| [i ? 0 : 1, i] }
    respond_with(@vocabulary)
  end

  def new
    @vocabulary = Vocabulary.new(parent_id: params[:parent_id])
    @vocabulary.terms.build
    respond_with(@vocabulary)
  end

  def edit
  end

  def create
    @vocabulary = Vocabulary.new(vocabulary_params.merge(creator: current_user, updater: current_user))
    flash[:notice] = 'Term was successfully created.' if @vocabulary.save
    respond_with(@vocabulary)
  end

  def update
    flash[:notice] = 'Term was successfully updated.' if @vocabulary.update(vocabulary_params.merge(updater: current_user))
    respond_with(@vocabulary)
  end

  def destroy
    @vocabulary.destroy
    respond_with(@vocabulary)
  end

  private
    def set_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    def vocabulary_params
      params.require(:vocabulary).permit(:record_type, :parent_id, terms_attributes: [:id, :prefered, :name, :language, :_destroy],
        comments_attributes: [:id, :prefered, :content, :language, :_destroy])
    end
end
