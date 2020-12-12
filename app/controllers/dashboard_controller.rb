class DashboardController < ApplicationController
  def index
    if current_list
      @list = current_list
      @trucks = @list.trucks.order(:sort).all
    else
      render file: "/public/401"
    end
  end
end