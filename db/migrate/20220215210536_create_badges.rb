class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :url
      t.string :rule
      t.timestamps
    end
  end
end