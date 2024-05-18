class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :amount
      t.references :subject
      t.timestamps
    end
  end
end
