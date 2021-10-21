class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers, on: :create

  private

  def validate_max_answers
    errors.add(:count, "max number of answers - 4") if question.answers.count > 4
  end
end