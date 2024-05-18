class Enemy < ApplicationRecord
  def self.killed_enemies
    Enemy.all.where(has_killed: true).count
  end
end
