class DashboardController < ApplicationController
  before_action :current_list?
  def index
    @list = current_list
    @trucks = @list.trucks.order(:sort).all

    respond_to do |format|
      format.html
      format.csv { send_data @trucks.to_csv, filename: "list-#{Date.today}.csv" }
    end
  end
end