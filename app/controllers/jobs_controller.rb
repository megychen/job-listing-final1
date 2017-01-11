class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all.where(:is_hidden => false).recent
    @jobs = case params[:order]
            when "by_upper_bound"
              Job.published.order("wage_upper_bound DESC")
            when "by_lower_bound"
              Job.published.order("wage_lower_bound DESC")
            else
              Job.published.order("created_at DESC")
            end
  end
  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "This job is archived"
      redirect_to root_path
    end
  end
end
