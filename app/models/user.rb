class User < ApplicationRecord

  def user_tests(test_level)
    Test.find_by(id: self.test_id, level: test_level)
  end
end