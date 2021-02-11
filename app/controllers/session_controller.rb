class SessionController < ApplicationController
  def create
    list = List.find_by name: params[:name]
    if list != nil && list.authenticate(params[:password])
      session[:list_id] = list.id 
      flash[:success] = "Successfully logged in."
      redirect_to "/dashboard"
    else
      flash[:error] = "Your credentials are incorrect."
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:list_id)
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end