class Specification < ActiveRecord::Base
  belongs_to :vocabulary
  belongs_to :specifyable, polymorphic: true
end
