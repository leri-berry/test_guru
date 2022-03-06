class BadgeService
  attr_reader :badges_count
  attr_reader :user
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @badges_count = @user.badges.count
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule, badge.value)
    end
  end

  def category(category_name)
    all_tests = Test.by_category(category_name)
    test_ids = all_tests.ids
    tests_count = all_tests.count
    success_tests_count = TestPassage.success.where(test_id: test_ids, user_id: @user.id).count
    tests_count == success_tests_count
  end

  def level(level)
    all_tests = Test.where(level: level.to_i)
    test_ids = all_tests.ids
    tests_count = all_tests.count
    success_tests_count = TestPassage.success.where(test_id: test_ids, user_id: @user.id).count
    tests_count == success_tests_count
  end


  def first_attempt(test_id)
    TestPassage.where(user_id: @user.id, test_id: test_id).count == 1
  end
end