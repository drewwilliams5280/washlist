class DashboardController < ApplicationController
  def index
    @list = current_list
  end
end