class Track < ActiveRecord::Base
  TRACK_TYPE = [ "BONUS", "REGULAR" ]

  attr_accessible :name, :type, :lyrics, :album_id

  validates :name, :type, :lyrics, :album_id, :presence => true

  belongs_to :album
end
