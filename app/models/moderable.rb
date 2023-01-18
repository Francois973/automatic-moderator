class Moderable < ApplicationRecord
  validates :is_accepted, presence: true
end
