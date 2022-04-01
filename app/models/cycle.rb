class Cycle < ApplicationRecord
  has_many :invitations, dependent: :destroy
  validates_presence_of :name
end
