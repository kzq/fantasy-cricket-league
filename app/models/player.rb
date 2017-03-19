class Player < ApplicationRecord
  belongs_to :league
  
  validates_presence_of :name, :league_id
end
