class User < ApplicationRecord

  def user_tests(test_level)
    tests.where(level: test_level)
  end
end
