class String
  # Converts plain email addresses and mailto links into SpamSpan markup.
  #
  # @param [Integer] paranoia_level SpamSpan paranoia level
  # @return [String] the input with all plain email addresses converted to
  #   SpamSpam markup
  def spamspanify paranoia_level = 1
    Spamspanify.all(self, paranoia_level)
  end
end
