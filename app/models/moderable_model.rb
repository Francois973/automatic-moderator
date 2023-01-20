class ModerableModel < ApplicationRecord
  include Moderable

  validates :is_accepted, presence: true
end
