class Question < ApplicationRecord
  belongs_to :test
  belongs_to :concept
end
