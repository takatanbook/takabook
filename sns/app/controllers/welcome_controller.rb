class WelcomeController < ApplicationController
  def index
  end

  def about
  end
  def talk
  	
  	sa = params[:order]
	sa1 = params[:order2]
	sa2 = params[:order3]

	$user_one = ''
	$user_two = ''
	unless sa.blank? && sa1.blank? && sa2.blank?
		user_name = session[:user_name]
		if user_name == (sa1)
			$user_one = sa1.dup
			$user_two = sa2.dup
		end
		if user_name == (sa2)
			$user_one = sa2.dup
			$user_two = sa1.dup
		end
		hash = {"Firend_ID" => sa, "My_User" => $user_one, "Firend_User" => $user_two }
		@to = hash
		session[:FIREND_ID] = @to['Firend_ID']
		@comments = Comment.where('friend_id = ?',@to['Firend_ID'])
		@welcome = Comment.all
	else
		user_name = session[:user_name]
		frind_id  = session[:FIREND_ID]
		@comments = Comment.where('friend_id = ?', frind_id)
	end

  end
  def create
  	$firend = session[:FIREND_ID]
	$comment = params[:comment]
	$User_name = session[:user_name]
    @com = Comment.new(friend_id: $firend , comment: $comment, user_name: $User_name)
	if @com.save
		
		@comments = Comment.where('friend_id = ?',$firend)
		render 'talk'
	else
	end
  end
end
