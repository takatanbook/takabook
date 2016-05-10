class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by user_email: params[:user_email].downcase
		if user && user.authenticate(params[:password])
			
			#sign in
			session[:user_id] = user.id
			session[:user_name] = user.user_name
			flash[:notice] = 'ログインしました。'
			redirect_to root_url
		else
			flash.now[:alert] = 'パスワード/メールアドレスが間違っています'
			render 'new'
		end
	end
	def destroy
		sign_out
		flash[:notice] = "ログアウトしました。"
		redirect_to root_url
	end
end

