class Truck < ApplicationRecord
  validates :unit_number, presence: true
  enum unit_type: [ "Panel Van", 
                    "High Roof Panel Van",
                    "12' Box Truck",
                    "16' Box Truck",
                    "22' Box Truck",
                    "26' Box Truck",
                    "Day Cab",
                    "Sleeper"
                  ]
end
