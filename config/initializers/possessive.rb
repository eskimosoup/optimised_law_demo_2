# http://stackoverflow.com/questions/1115283/making-a-rails-inflection-for-possessive-strings
module StringExtensions
  def possessive
    self + ('s' == self[-1,1] ? "'" : "'s")
  end
end

class String
  include StringExtensions
end
