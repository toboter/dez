class ArtefactIdentificator < ActiveRecord::Base
  belongs_to :artefact
  belongs_to :excavation

  validates :name, :excavation, presence: true

  def excavation_name
  	"#{excavation.shortcut} #{name}"
  end
end
