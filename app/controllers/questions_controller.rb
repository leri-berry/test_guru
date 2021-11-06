class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy edit update show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    @questions = @test.questions
  end

  #def show
    #@question
  #end

  def new
    @question = @test.questions.new
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end


  def create
    new_question = @test.questions.new(question_params)

    if new_question.save
      redirect_to new_question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end