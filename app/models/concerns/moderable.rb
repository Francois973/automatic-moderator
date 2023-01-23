module Moderable
  extend ActiveSupport::Concern

  included do
    after_create :moderator

    def moderator
      I18n.available_locales = [:en]
      string_to_be_sent = format_string_with_attributes
      remove_accent = I18n.transliterate(string_to_be_sent)
      url = URI("https://moderation.logora.fr/predict?text=#{remove_accent}")
      response = Net::HTTP.get_response(url)
      result = JSON.parse(response.body)
      return unless result['prediction']['0'] < 0.90

      self.is_accepted = true
    end

    def format_string_with_attributes
      self.class.attribute_names.map do |attribute|
        send(attribute)
      end.join(' ')
    end
  end

  class_methods do
    def moderate(*attributes)
      @attribute_names = attributes
    end

    def attribute_names
      @attribute_names || []
    end
  end
end
