class BadgeService

  CATEGORY_ID = 1

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send(badge.rule, @test_passage)
    end
  end

  def category(test_passage)
    all_tests = Test.where(category_id: CATEGORY_ID).ids
    TestPassage.where(test_id: all_tests).map { |tp| tp.passed? }
  end

  def first_attempt(test_passage)
    TestPassage.where(user_id: test_passage.user_id, test_id: test_passage.test_id).count == 1 && test_passage.passed?
  end

  def level(test_passage)
    level = test_passage.test.level
    all_tests = Test.where(level: level).ids
    TestPassage.where(test_id: all_tests).map { |tp| tp.passed? }
  end
end