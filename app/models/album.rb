class Album < ActiveRecord::Base
  ALBUM_TYPE = [ 'LIVE', 'STUDIO' ]

  attr_accessible :title, :type, :band_id

  validates :title, :type, :band_id, :presence => true

  belongs_to :band
  has_many(
    :recordings,
    :foreign_key => :track_id,
    :class_name => "Track",
    :dependent => :destroy
  )


end
