class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users, join_table: 'test_users'
  
  def self.sort_by_category(category_title)
    joins(:category).where(categories: { title: category_title}).order(title: :desc).pluck(:title)
  end
end