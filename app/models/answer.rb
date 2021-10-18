class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers

  private

  def validate_max_answers
    errors.add("should be from 1 to 4 answers") if question.answers.count > 4
  end
end