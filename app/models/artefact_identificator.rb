class ArtefactIdentificator < ActiveRecord::Base
  belongs_to :artefact
  belongs_to :excavation
end
