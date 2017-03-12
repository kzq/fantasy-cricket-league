class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :description
end
