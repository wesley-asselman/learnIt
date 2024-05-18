class Concept < ApplicationRecord
  belongs_to :glossary

  def next
    current_index = glossary.concepts.index(self)

    # Calculate the index of the next concept
    next_index = current_index + 1

    # Check if the next concept exists
    if next_index < glossary.concepts.length
      next_concept = glossary.concepts[next_index]
      # Now you have the next concept, you can use it to create your link
      return next_concept
    else
      # There is no next concept
      return false
    end
  end

  def previous
    current_index = glossary.concepts.index(self)

    # Calculate the index of the next concept
    previous_index = current_index - 1

    # Check if the next concept exists
    if previous_index >= 0
      previous_concept = glossary.concepts[previous_index]
      # Now you have the next concept, you can use it to create your link
      return previous_concept
    else
      # There is no next concept
      return false
    end
  end
end
