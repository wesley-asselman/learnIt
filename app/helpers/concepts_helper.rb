module ConceptsHelper

  def explanation_with_links(explanation, glossary_id)
    words = explanation.downcase.split
    concepts = Concept.where(glossary_id: glossary_id).pluck(:title).map(&:downcase)
  
    common_words = words & concepts
  
    if common_words.any?
      common_words.each do |common_word|
        original_word_index = words.find_index { |word| word.downcase == common_word }
        words[original_word_index] = "<a href=##{common_word}>#{common_word}</a>" if original_word_index
      end
    end
  
    # Join the modified words back into a string
    modified_explanation = words.join(" ").html_safe

    # Split the text into sentences using regular expressions
    sentences = modified_explanation.split(/(?<=[.!?])\s+/)

    # Capitalize the first word of each sentence
    sentences.map! do |sentence|
      sentence.sub(/\A\w+/) { |match| match.capitalize }
    end
  
    # Join the sentences back together
    capitalized_text = sentences.join(' ')
    
    return capitalized_text.html_safe
  
  end
  

end
