class Artefact < ActiveRecord::Base
  dragonfly_accessor :image
  dragonfly_accessor :drawing

  has_many :artefact_identificators, dependent: :destroy
  has_many :excavations, through: :artefact_identificators
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :restorations, dependent: :destroy
  has_many :dispositions, dependent: :destroy
  has_many :specifications, as: :specifyable, dependent: :destroy
  has_many :terms, class_name: 'Vocabulary', through: :specifications, source: :vocabulary

  belongs_to :creator, class_name: 'User'
  belongs_to :updater, class_name: 'User'

  accepts_nested_attributes_for :artefact_identificators, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :restorations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :dispositions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :specifications, reject_if: :all_blank, allow_destroy: true

  default_scope {order(dez: :asc)}

  def name
    if dez
      "DeZ #{dez}#{dez_index}"
    elsif artefact_identificators.any?
      'undefined'
    end 
  end

  # filter config
  ransacker :sdez do #convert dez to string
    Arel.sql("to_char(dez, '9999999')")
  end

  ransacker :fdez do |parent|
    Arel::Nodes::InfixOperation.new('||',
      parent.table[:dez], parent.table[:dez_index])
  end
end
