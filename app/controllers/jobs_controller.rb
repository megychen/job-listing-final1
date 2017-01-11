class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @jobs = Job.all.where(:is_hidden => false).recent
  end

  def show
    @job = Job.find(params[:id])
  end
end
