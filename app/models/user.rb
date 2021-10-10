class User < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: 'test_users'

  def user_tests(test_level)
    tests.where(level: test_level)
  end
end