require "spamspanify/version"
require "spamspanify/core_ext/string"
require "spamspanify/exceptions"

module Spamspanify
  # TODO split EMAIL_REGEXP in separate local and domain parts
  EMAIL_REGEXP = /([\w|&|\-\.])+@([\w|\-\.])+\w+/
  MAILTO_REGEXP = /<a\s*href=(\'|\")mailto:#{ EMAIL_REGEXP }(\'|\").*<\/a>/

  module_function

  # Converts plain email addresses and mailto links in the input into SpamSpan
  # markup.
  #
  # @param [String] input
  # @param [Integer] paranoia_level SpamSpan paranoia level
  # @return [String] the input with all plain email addresses converted to
  #   SpamSpam markup
  def all input, paranoia_level = 1
    plain_email_addresses(mailto_links(input, paranoia_level), paranoia_level)
  end

  # Converts all plain email addresses in the input into SpamSpan markup.
  #
  # @param [String] input
  # @param [Integer] paranoia_level SpamSpan paranoia level
  # @return [String] the input with all plain email addresses converted to
  #   SpamSpam markup
  def plain_email_addresses input, paranoia_level = 1
    input.gsub(EMAIL_REGEXP) do |email|
      create_markup(email, paranoia_level)
    end
  end

  # Converts all HTML mailto links in the input into SpamSpan markup.
  #
  # @param [String] input
  # @param [Integer] paranoia_level SpamSpan paranoia level
  # @return [String] the input with all plain email addresses converted to
  #   SpamSpam markup
  def mailto_links input, paranoia_level = 1
    input.gsub(MAILTO_REGEXP) do |mailto|
      create_markup(mailto[EMAIL_REGEXP], paranoia_level, mailto.split(">")[1].split("<")[0])
    end
  end

  # Creates SpanSpam HTML markup.
  #
  # @param [String] email_address
  # @param [Integer] paranoia_level
  # @param [String] mailto_link_text
  # @return [String] SpamSpan HTML markup
  # @raise [Spamspanify::ParanoiaLevelNotSupportedError] when a not supported
  #   paranoia level is requested
  def create_markup email_address, paranoia_level = 1, mailto_link_text = nil
    mailto_link_text = nil if (email_address == mailto_link_text)
    user, domain = email_address.split("@")
    case paranoia_level
    when 1
      "<span class='spamspan'><span class='u'>#{ user }</span>@<span class='d'>"\
        "#{ domain }</span>#{ "(<span class='t'>#{ mailto_link_text }</span>)" if mailto_link_text }</span>"
    when 3
      "<span class='spamspan'><span class='u'>#{ undotify(user) }</span> [at] "\
        "<span class='d'>#{ undotify(domain) }</span>#{ "(<span class='t'>#{ mailto_link_text }</span>)" if mailto_link_text }</span>"
    else
      Raise ParanoiaLevelNotSupportError
    end
  end

  # Converts every "." in a string into " [dot] "
  #
  # @param [String] input
  # @return [String] the input with each dot replaced by " [dot] "
  def undotify input
    input.gsub ".", " [dot] "
  end
end
