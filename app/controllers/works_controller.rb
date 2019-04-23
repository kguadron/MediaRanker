class WorksController < ApplicationController
  def index
    @works = Work.all
    @media_spotlight = @works.sample
  end

  def show
    @work = Work.find_by(id: params[:id])
    unless @work
      head :not_found
    end
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
