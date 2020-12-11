class ListController < ApplicationController
  def new
    @truck_types = Truck.unit_types.keys
  end
end