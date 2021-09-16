class Test < ApplicationRecord
  
  def self.sort_by_category(category_title)
    joins(:categories).where(categories: {title: category_title}).order(title: :desc).pluck(:title)
  end
end 