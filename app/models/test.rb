class Test < ApplicationRecord
  has_many :questions
  belongs_to :glossary
  belongs_to :subject

  def create_questions
    if !questions.any?

      random_concepts = self.glossary.concepts.order("RANDOM()").limit(question_amount).distinct
      random_concepts.each do |concept|  

      @answers = self.create_answers(concept)
      
      @question = Question.new(
        concept_id: concept.id,
        test_id: id,
        number: questions.last ? questions.last.number + 1 : 1,
        answers: @answers,
        )
        @question.save 
      end
      return true
    end
  end

  def create_answers(concept)
    possible_answers = self.glossary.concepts.where('id > ?', concept.id).limit(5).ids + self.glossary.concepts.where('id < ?', concept.id).limit(5).order(id: :desc).ids

    shuffled_answers = possible_answers.shuffle
    
    answers = shuffled_answers.uniq.first(3)
    answers << concept.id

    return answers.shuffle
  end

  def correct_answers 
    correct_answers = 0
    questions.each do |question|
      if question.selected_answer && question.selected_answer.to_i == question.concept_id
        correct_answers += 1
      end
    end
    return correct_answers
  end
end
