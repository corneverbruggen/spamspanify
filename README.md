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

Simply call the {String#spamspanify} method on a string. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Spamspanify is released under a MIT License 
