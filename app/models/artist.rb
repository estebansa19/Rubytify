class Artist < ApplicationRecord
  serialize :genres, Array
  has_many :albums
  has_many :songs, through: :albums
end
