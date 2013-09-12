# I18nUtils

I18n utilities for Ruby on Rails.


## Usage

Just `include I18nUtils::Helper` in e.g. your `ApplicationHelper` to get all the things.

Or see under each section to only get that part.


### `t_model`, `t_attribute`

Get this part with `include I18nUtils::Model` in e.g. your `ApplicationHelper`.

I think the Rails way to translate attributes and models is ugly and on the wrong object.

With this, your views can do `t_model(User)` instead of `User.model_name.human`.

Also `t_attribute(User, :email)` instead of `User.human_attribute_name(:email)`.

Want to use them outside views? Feel free to include the module anywhere you like, or call them via the `I18nUtils` object, e.g. `I18nUtils.t_model(User)`.

You could even do `I18n.extend(I18nUtils::Model)` to get e.g. `I18n.t_model(User)`.


### `t_scope`

Get this part with `include I18nUtils::Scope` in e.g. your `ApplicationHelper`.

Links or other markup in the middle of a translation is tricky. Either you put the HTML straight in the translation and risk the translator messing it up, or it becomes a mess:

``` slim
= t(:"welcome.sign_in_now.text",
  sign_in: link_to(t(:"welcome.sign_in_now.sign_in"), sign_in_url))
```

The `t_scope` helper lets you use blocks for interpolated values, in your regular template:

``` slim
= t_scope(:"welcome.sign_in_now.text") do |scope|
  - scope.sign_in do
    = link_to(scope.t(:sign_in), sign_in_url)
```


## Installation

Add this line to your application's Gemfile:

    gem 'i18n_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n_utils
