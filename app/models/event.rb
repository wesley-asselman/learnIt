class Event < ApplicationRecord

  belongs_to :timeline

  def formatted_year
    if year < 0
      year.to_s.gsub('-', '').to_i
    else
      year
    end
  end
end
