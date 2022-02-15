class AddPublishedToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :published, :boolean
  end
end
