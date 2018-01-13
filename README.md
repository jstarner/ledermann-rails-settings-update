# Ledermann Rails Settings Update

[![Gem Version](https://badge.fury.io/rb/ledermann-rails-settings-update.svg)](https://badge.fury.io/rb/ledermann-rails-settings-update) <img src="https://travis-ci.org/jonhue/ledermann-rails-settings-update.svg?branch=master" />

Simplifying updating settings from controllers. Ledermann Rails Settings Update depends on [Ledermann Rails Settings](https://github.com/ledermann/rails-settings).

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Forms](#forms)
    * [Controllers](#controllers)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

**Note:** Before installing Ledermann Rails Settings Update make sure to setup the original [Ledermann Rails Settings](https://github.com/ledermann/rails-settings) gem.

Ledermann Rails Settings Update works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'ledermann-rails-settings-update'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ledermann-rails-settings-update

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'ledermann-rails-settings-update', github: 'jonhue/ledermann-rails-settings-update'
```

---

## Usage

### Forms

Let's say we have this `Post` model:

```ruby
class Post < ApplicationRecord
    has_settings do |s|
        s.key :preferences, defaults: { language: 'en' }
    end
end
```

To update this `preferences/language` setting, a form could look like this:

```haml
= simple_form_for @post, url: @post, html: { method: :put } do |f|
    = f.input :title
    = text_field_tag 'post[settings][preferences][language]'
    = f.input :submit
```

### Controllers

Here is a corresponding controller:

```ruby
class PostsController < ApplicationController

    def update
        @post = Post.find params[:id]
        update_settings @post
        @post.update! post_params
        redirect_back fallback_location: root_path, notice: 'Post updated'
    end

    private

    def post_params
        params.require(:post).permit(:title)
    end

    def settings_params
        params.require(:post).permit(
            settings: [
                preferences: [:language]
            ]
        )
    end

end
```

**Note:** The `private` `settings_params` method is required.

---

## To Do

[Here](https://github.com/jonhue/ledermann-rails-settings-update/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/ledermann-rails-settings-update/issues/new).

---

## Contributing

We hope that you will consider contributing to Ledermann Rails Settings Update. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/ledermann-rails-settings-update/graphs/contributors

### Semantic Versioning

Ahoy Views follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
