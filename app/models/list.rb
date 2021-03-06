class List < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  has_many :trucks, :dependent => :destroy
end
