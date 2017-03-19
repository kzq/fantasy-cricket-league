class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :country
  has_one :league
  link(:href) { api_players_url }
end
