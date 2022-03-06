class UserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :badge, foreign_key: true
      t.timestamps
    end
  end
end