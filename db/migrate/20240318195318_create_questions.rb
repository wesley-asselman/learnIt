class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :test
      t.references :concept
      t.string :answers, array: true
      t.integer :selected_answer
      t.integer :number
      t.timestamps
    end
  end
end
