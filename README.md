# I18nUtils

I18n utilities for Ruby on Rails.


## Usage

### `t_model`, `t_attribute`

I think the Rails way to translate attributes and models is ugly and on the wrong object.

Just `include I18nUtils::Helpers` in e.g. your `ApplicationHelper`.

Now, your views can do `t_model(User)` instead of `User.model_name.human`.

Also `t_attribute(User, :email)` instead of `User.human_attribute_name(:email)`.

Want to use them outside views? Feel free to include the module anywhere you like, or call them via the `I18nUtils` object, e.g. `I18nUtils.t_model(User)`.

You could even do `I18n.extend I18nUtils::Helpers` to get e.g. `I18n.t_model(User)`.


## Installation

Add this line to your application's Gemfile:

    gem 'i18n_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_utils
