class DashboardController < ApplicationController
  def index
    render file: "/public/401" unless current_list
    @list = current_list
  end
end