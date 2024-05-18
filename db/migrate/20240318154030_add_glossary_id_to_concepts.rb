class AddGlossaryIdToConcepts < ActiveRecord::Migration[6.1]
  def change
    add_column :concepts, :glossary_id, :integer
  end
end
