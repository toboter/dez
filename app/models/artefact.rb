class Artefact < ActiveRecord::Base
  has_many :artefact_identificators, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :creator, class_name: 'User'
  belongs_to :updater, class_name: 'User'

  accepts_nested_attributes_for :artefact_identificators, reject_if: :all_blank, allow_destroy: true
end
