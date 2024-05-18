class RemoveSubjectIdFromConcepts < ActiveRecord::Migration[6.1]
  def change
    remove_column :concepts, :subject_id
  end
end
