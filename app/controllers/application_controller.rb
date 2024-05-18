class ApplicationController < ActionController::Base

  def test
    @glossary = Glossary.find(1)
    @question = @glossary.concepts.sample
    @question_explanation = @question.explanation
    
      answers = []
      3.times do |answer|
        answers << @glossary.concepts.sample.title
      end
      answers << @question.title

    @answers = answers.shuffle
  end

end
