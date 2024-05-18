class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.references :subject
      t.references :glossary
      t.integer :question_amount
      t.integer :last_answered
      t.timestamps
    end
  end
end
