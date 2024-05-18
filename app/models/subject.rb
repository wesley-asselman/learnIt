class Subject < ApplicationRecord
  has_many :assignments
  has_many :concepts
  has_many :glossaries
  has_many :tests

end
