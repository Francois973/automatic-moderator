class ModerableModel < ApplicationRecord
  include Moderable
  moderate :content

  validates :content, presence: true
end
