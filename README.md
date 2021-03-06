# Layer::IdentityToken

[![Gem Version](https://badge.fury.io/rb/layer-identity_token.svg)](http://badge.fury.io/rb/layer-identity_token)

Use this class to generate a token for authenticating the Layer SDK

## Installation

Add this line to your application's Gemfile:

    gem 'layer-identity_token'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install layer-identity_token

## Setup

1. Create a layer app
2. Write down your `provider ID` (app's info tab)
3. Create a new private key (app's authentication tab – _we recommend to create keys for each developer and/or environments like: staging, development_)
4. Save the `private key` and note the `key ID`

## Usage

```ruby
token = Layer::IdentityToken.new(user_id, nonce, optional_expires_at)
token.encode
```

### Integration

If you want to return this token as JSON and your framework (like Rails) uses `#as_json` you just write a controller like:

```ruby
class ApiController
  def hello_layer
    token = Layer::IdentityToken.new(current_user.id, params[:nonce])

    render json: token
  end
end
```

### Usage with Identity attributes

If you want to set some attributes on the Layer Identity, allowed attributes are: `first_name`, `last_name`, `display_name`, and `avatar_url`:

```ruby
token = Layer::IdentityToken.new(user.id, nonce, expires_at, {
  'first_name' => user.first_name,
  'last_name' => user.last_name,
  'display_name' => user.display_name,
  'avatar_url' => user.avatar_url
})

token.encode
```

## Configuration

Per default the class looks for ENV variables like:

```
LAYER_PROVIDER_ID
LAYER_KEY_ID
LAYER_PRIVATE_KEY
```

If you can not set ENV variables you can also set them on the class directly:

```ruby
Layer::IdentityToken.layer_provider_id = "layer:///providers/PROVIDER_ID"
Layer::IdentityToken.layer_key_id = "layer:///keys/KEY_ID"
Layer::IdentityToken.layer_private_key = "private_key"
```

_The prefixes are not needed necessarily as we do some normalizing on these IDs for compatibility reasons._

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
