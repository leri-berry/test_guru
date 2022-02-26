class Badge < ApplicationRecord
  RULE_TYPES = %w[category level first_attempt].freeze

  has_many :user_badges, dependent: :destroy
  validates :title, :rule, :url, presence: true

end