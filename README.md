# Automatic-moderator

This application works with Ruby on Rails, it has a concern that takes care of the moderation and can be used for any attributes coming from any model. This way we can avoid duplicating the code in the models (if they need the moderation functionality).

## Technical informations

- Ruby 3.1.2
- Ruby on Rails 7.0.4 
- Postgresql 1.4.4

## Moderable Concern

This part of the concern allows us to accept all attributes without taking into account their names and thus avoid adding lines of code to specify the attributes.

```ruby
module Moderable
  extend ActiveSupport::Concern
  
   class_methods do
    def moderate(*attributes)
      @attribute_names = attributes
    end

    def attribute_names
      @attribute_names || []
    end
  end
end
```

As a result, the class method "moderate" can be called on the attributes for which moderation is desired in the models.

Without forgetting the addition of the concern via the "include" in the model

```ruby
class ModerableModel < ApplicationRecord
  include Moderable
  moderate :content

  validates :content, presence: true
end

class Post < ApplicationRecord
  include Moderable
  moderate :body

  validates :body, presence: true
end
```


## How moderation works

```ruby
module Moderable
  extend ActiveSupport::Concern
  included do
      before_save :moderator

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
  end
```

The moderation itself works with the Logora API, using the "/predict" route, it returns a probability that the content will be "rejected". 

In our case, we consider that a content can be restricted if its probability is higher than "0.90", otherwise its attribute is_accepted (which is a boolean with a default value of false) will automatically be set to "true" which will display the content without a restriction message.

## Getting started and pre-requisites

### Versions

```sh
Ruby 3.1.2
Rails 7.0.4.1
```
### Clonage

```sh
git clone git@github.com:Francois973/automatic-moderator.git
```

### Install the depandancies

```sh
bundle install
```

### Migrate schema of database

```sh
rails db:migrate
```

### Start 🚀

```sh
rails server
```
------> Start [https://localhost:3000](https://localhost:3000) 💎
