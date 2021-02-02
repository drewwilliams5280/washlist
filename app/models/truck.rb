class Truck < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort
  
  validates :unit_number, presence: true
  belongs_to :list
  has_many :notes, :dependent => :destroy
  enum status: ["Not Started", "In Progress", "Finished"]
  enum unit_type: [ "Panel Van", 
                    "High Roof Panel Van",
                    "12' Box Truck",
                    "16' Box Truck",
                    "22' Box Truck",
                    "26' Box Truck",
                    "Day Cab",
                    "Sleeper"
                  ]
  def self.to_csv
    attributes = %w{unit_number unit_type status latest_note}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.each do |truck|
        csv << attributes.map{ |attr| truck.send(attr) }
      end
    end
  end

  def latest_note
    if notes.last != nil
      notes.last.text
    else
      ""
    end
  end
end
