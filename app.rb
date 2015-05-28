require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './models/user'

enable :sessions

# Filter that runs before all routes 
before do 
	if session[:user_id] != nil
		@current_user = User.find(session[:user_id])
	else 
		@current_user = nil
	end
end

get '/' do 
	if @current_user != nil
		erb :index
	else 
		redirect('/login')
	end
end

get '/login' do 
	erb :login
end

post '/login' do 
	user = User.find_by(:email => params[:email])

	if user && user.authenticate(params[:password])
		# Set the session 
		session[:user_id] = user.id
		redirect('/')
	else 
		erb :login
	end
end

get '/register' do 

	erb :register
end

post '/register' do 
	user = User.new(:username => params[:username], :password => params[:password])
	user.encrypt_password
	user.save

	redirect('/')
end

get '/logout' do 
	session.clear

	erb :logout
end