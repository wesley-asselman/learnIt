class CreateGlossaries < ActiveRecord::Migration[6.1]
  def change
    create_table :glossaries do |t|
      t.string :title
      t.references :subject
      
      t.timestamps
    end
  end
end
