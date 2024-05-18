class CreateConcepts < ActiveRecord::Migration[6.1]
  def change
    create_table :concepts do |t|
      t.string :title
      t.text :explanation
      t.integer :page
      t.references :subject
      t.timestamps
    end
  end
end
