class ListController < ApplicationController
  def new
  end

  def create
    list = List.new(list_params)
    if list.save
      flash[:success] = "Your WashList has been created!"
      session[:list_id] = list.id
      redirect_to '/dashboard'
    else
      flash[:error] = list.errors.full_messages.uniq.to_sentence
      render :new
    end
  end

  private

  def list_params
    params.permit(:name, :password, :password_confirmation)
  end
end