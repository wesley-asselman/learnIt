class AddFinishedToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :is_finished, :boolean
  end
end
