class AddPassedToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :passed, :boolean, default: false
  end
end