class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end
  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def index
    @goals = Goal.all.includes(:user)
    render :index
  end

  private
  def goal_params
    params.require(:goal).permit(:content, :exposure, :status)
  end
end
