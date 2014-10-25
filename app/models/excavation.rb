class Excavation < ActiveRecord::Base
  has_many :artefact_identificators
  has_many :artefacts, through: :artefact_identificators

  validates :name, :shortcut, presence: true
end
