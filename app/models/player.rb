class Player < ApplicationRecord
  belongs_to :league
  validates_presence_of :name, :league_id
  self.per_page = 10
end
