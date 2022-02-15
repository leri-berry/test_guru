class Admin::QuestionsController < Admin::BaseController
  
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[destroy edit update show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found


  def index
    @questions = @test.questions
  end

  def new
    @question = @test.questions.new
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test_id)
    else
      render :edit
    end
  end


  def create
    new_question = @test.questions.new(question_params)

    if new_question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end