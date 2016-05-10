class UpdateController < ApplicationController
	def create
  	$firend = session[:FIREND_ID]
	$comment = params[:comment]
	$User_name = session[:user_name]
    @com = Comment.new(friend_id: $firend , comment: $comment, user_name: $User_name)
	if @com.save
		
		@comments = Comment.where('friend_id = ?',$firend)
		render 'welcome/talk'
	else
	end
  end
end
