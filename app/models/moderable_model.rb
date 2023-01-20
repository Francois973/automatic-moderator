class ModerableModel < ApplicationRecord
  include Moderable

  validates :content, presence: true
  validates :is_accepted, presence: true
end
