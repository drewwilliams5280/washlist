class ListController < ApplicationController
  def new
    @unit_types = Truck.unit_types.keys
  end

  def create
    redirect_to '/dashboard'
  end
end