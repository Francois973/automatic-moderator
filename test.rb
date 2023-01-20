require 'net/http'
require 'awesome_print'
require 'pry-byebug'
require 'i18n'

def fetch_prediction(string)
  I18n.available_locales = [:en]
  remove_accent = I18n.transliterate(string)
  url = URI("https://moderation.logora.fr/predict?text=#{remove_accent}")
  response = Net::HTTP.get_response(url)
  response.body
end

ap fetch_prediction('Bonjour je suis très jeune')
