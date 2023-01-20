module Moderable
  extend ActiveSupport::Concern

  included do
    attr_accessor :is_accepted

    def accepted_content?
      I18n.available_locales = [:en]
      remove_accent = I18n.transliterate(content)
      url = URI("https://moderation.logora.fr/predict?text=#{remove_accent}")
      response = Net::HTTP.get_response(url)
      result = JSON.parse(response.body)
      return unless result['prediction']['0'] < 0.90

      self.is_accepted = true
    end
  end
end
