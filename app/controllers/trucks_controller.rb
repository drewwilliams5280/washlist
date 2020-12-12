class TrucksController < ApplicationController
  before_action :current_list?
  def new
    @unit_types = Truck.unit_types.keys
  end

  def create
    truck = current_list.trucks.new(unit_number: params[:unit_number], 
                                        unit_type: Truck.unit_types[params[:unit_type]])
    if truck.save
      truck.notes.create!(text: params[:note]) if params[:note]     
      redirect_to '/dashboard'
    else
      flash[:error] = truck.errors.full_messages.uniq.to_sentence
      render :new
    end
  end
end