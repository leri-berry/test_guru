class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users
  
  def self.sort_by_category(category_title)
    joins(:category).where(categories: { title: category_title}).order(title: :desc).pluck(:title)
  end
end