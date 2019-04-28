class VotesController < ApplicationController
  def create
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      work = Work.find_by(id: params[:work_id])
      user_votes = user.votes
      work_votes = work.votes

      user_votes.each do |vote|
        if work_votes.include?(vote)
          flash[:status] = :error
          flash[:message] = "You have already voted for this media"
          redirect_to work_path(work.id)
          return
        end
      end
    
      vote = Vote.create(
        work_id: params[:work_id],
        user_id: session[:user_id],
      )
    
      user.votes << vote
      work.votes << vote
      flash[:success] = "Successfully upvoted!"
    else
      flash[:error] = "A problem occurred: You must login to do that"
    end
  end
end
