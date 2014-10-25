class Vocabulary < ActiveRecord::Base
  acts_as_tree dependent: :destroy

  has_many :terms, dependent: :destroy
  has_many :specifications, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :creator, class_name: 'User'
  belongs_to :updater, class_name: 'User'

  accepts_nested_attributes_for :terms, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  scope :concept, -> { where(record_type: 'concept') }
  scope :hierarchy, -> { where(record_type: 'hierarchy') }

  def self.possible_parents(vocab)
    vocab ? (all-vocab.self_and_descendants) : all
  end

  def name_for_select
    '- ' * depth + prefered_term.name
  end

  def self.arrange_as_tree(options={}, hash=nil)
    hash ||= hash_tree(options)

    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_tree(options, children) unless children.nil?
    end
    arr
  end

  def prefered_term
  	terms.first
  end

  def prefered_note
    comments.first
  end

end
