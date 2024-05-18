class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|

      t.string :title
      t.string :explanation
      t.integer :year
      t.references :timeline
      t.timestamps
    end
  end
end
