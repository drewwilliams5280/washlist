class SessionController < ApplicationController
  def create
    list = List.find_by name: params[:name]
    if list != nil && list.authenticate(params[:password])
      session[:list_id] = list.id 
      flash[:success] = "You have successfully signed in to your WashList!"
      redirect_to "/dashboard"
    else
      flash[:error] = "Your credentials are incorrect."
      redirect_to "/"
    end
  end
end