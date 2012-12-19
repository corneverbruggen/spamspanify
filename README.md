# Spamspanify

Extends the String class with a {String#spamspanify} method that converts email
addresses in the string into [SpamSpan](http://www.spamspan.com) HTML markup.
This HTML markup can then easily be transformed in a clickable mailto link in
the browser by using the SpanSpan javascript library.

__Note:__ Currently only paranoia levels 1 and 3 are supported.
See the [SpamSpan website](http://www.spamspan.com) for info on paranoia
levels.

## Installation

Add this line to your application's Gemfile:

    gem 'spamspanify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spamspanify

## Usage

Simply call the spamspanify method on a string:

    text = "Feel free to <a href='mailto:info@example.com'>send us an email</a>"

    # Default paranoia level (1):
    text.spamspanify
    # => "Feel free to <span class='spamspan'><span class='u'>info</span>@<span class='d'>example.com</span>(<span class='t'>send us an email</span>)</span>"

    # Paranoia level 3:
    text.spamspanify(3)
    # => "Feel free to <span class='spamspan'><span class='u'>info</span> [at] <span class='d'>example [dot] com</span>(<span class='t'>send us an email</span>)</span>"



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Spamspanify is released under a MIT License 
