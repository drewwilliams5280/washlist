class Note < ApplicationRecord
  validates_presence_of :text
  belongs_to :truck
end
