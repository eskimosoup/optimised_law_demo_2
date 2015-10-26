# Use the following in a model:
# include NullifyBlanks

# http://stackoverflow.com/questions/7202319/rails-force-empty-string-to-null-in-the-database
# app/models/cocerns/nullify_blanks.rb
module NullifyBlanks
  extend ActiveSupport::Concern

  included do
    before_save :normalize_blank_values
  end

  def normalize_blank_values
    attributes.each do |column, _value|
      self[column].present? || self[column] = nil
    end
  end
end
