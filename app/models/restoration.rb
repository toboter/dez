class Restoration < ActiveRecord::Base
  belongs_to :artefact
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
