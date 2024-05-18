class Timeline < ApplicationRecord

  belongs_to :glossary
  has_many :events
  
end
