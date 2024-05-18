class Glossary < ApplicationRecord
  belongs_to :subject
  has_many :concepts
  has_one :timeline

end
