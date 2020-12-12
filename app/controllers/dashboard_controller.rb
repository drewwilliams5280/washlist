class DashboardController < ApplicationController
  before_action :current_list?
  def index
    @list = current_list
    @trucks = @list.trucks.order(:sort).all
  end
end