class Excavation < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  has_many :artefact_identificators
  has_many :artefacts, through: :artefact_identificators

  belongs_to :creator, class_name: 'User'
  belongs_to :updater, class_name: 'User'

  validates :name, presence: true, unless: :dai_gazetter_id?
  validates :dai_gazetter_id, presence: true, unless: :name?


  def name
  	read_attribute(:name).present? ? read_attribute(:name) : dai_gazetter_id
  end
end
