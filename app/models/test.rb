class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users

  scope :easy, -> { where(level: 0..1) }
  scope :moderate, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  scope :sort_by_category, -> (category_title) {joins(:category).where(categories: { title: category_title}).order(title: :desc).pluck(:title)}

  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: {only_integer: true, greater_than: 0}
end