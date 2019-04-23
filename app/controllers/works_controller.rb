class WorksController < ApplicationController

  def index
    def index
      @works = Work.all
      @media_spotlight = @works.sample
    end
  end

  def show
  end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
