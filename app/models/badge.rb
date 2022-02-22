class Badge < ApplicationRecord
  RULE_TYPES = %w[category level first_attempt].freeze

  has_many :users, through: :user_badges

  validates :title, :rule, :url, presence: true

end