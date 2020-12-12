class TrucksController < ApplicationController
  before_action :current_list?
  def show
    @truck = Truck.find(params[:id])
  end

  def edit
    @truck = Truck.find(params[:id])
    @unit_types = Truck.unit_types.keys
    @statuses = Truck.statuses.keys
  end

  def new
    @unit_types = Truck.unit_types.keys
  end

  def create
    truck = current_list.trucks.create!(unit_number: params[:unit_number], 
                                        unit_type: Truck.unit_types[params[:unit_type]])
    truck.notes.create!(text: params[:note]) unless params[:note].empty?   
    redirect_to '/dashboard'
  end

  def update
    truck = Truck.find(params[:id])
    truck.update(unit_number: params[:unit_number], 
                unit_type: Truck.unit_types[params[:unit_type]],
                status: Truck.statuses[params[:status]])
    truck.notes.create!(text: params[:note]) unless params[:note].empty?
    redirect_to '/dashboard'
  end

  def destroy
    Truck.find(params[:id]).destroy
    redirect_to '/dashboard'
  end
end