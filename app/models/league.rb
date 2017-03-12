class League < ApplicationRecord
  validates_presence_of :name, :country
end