class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :description
  link(:href) { api_league_url(object.id) }
end
