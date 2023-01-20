module Moderable
  extend ActiveSupport::Concern

  included do
    attr_accessor :content

    def accepted?
      url = URI("https://moderation.logora.fr/predict?text=#{content}")
      response = Net::HTTP.get_response(url)
      ap response
    end
  end
end
