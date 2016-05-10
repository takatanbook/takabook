class HomeController < ApplicationController
	def index
	  	@users = User.all
		user_name = session[:user_name]
		#@friends = Friend.where(friend_user_one: user_name or friend_user_two: user_name).and("friend_user_status =1")
		@friends = Friend.where('(friend_user_one = ? OR friend_user_two = ?) and friend_user_status =1', user_name,user_name)
		#@friends = Friend.all
		#@friends = Friend.find_by_sql(['select * from friends where (friend_user_one = :id or friend_user_two = :id ) and friend_user_status =1', {id: user_name }])
	end
	#def talk
		#render text: params[:friend]
	#end
end
