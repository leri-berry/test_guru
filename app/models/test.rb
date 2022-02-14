class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :moderate, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category_title) {joins(:category).where(categories: { title: category_title})}
  scope :published, -> { where(published: true) }

  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: {only_integer: true, greater_than: 0}

  def self.sort_by_category(category_title)
    by_category.order(title: :desc).pluck(:title)
  end
end