class ArtefactIdentificator < ActiveRecord::Base
  belongs_to :artefact
  belongs_to :excavation

  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, :excavation, presence: true

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  def excavation_name
  	excavation.shortcut.presence || excavation.name
  end
  
end
