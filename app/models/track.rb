# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  track_style :string           not null
#  lyrics      :string
#  album_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Track < ActiveRecord::Base

  TRACK_STYLE = %w(regular bonus)

  validates(
    :name,
    :track_style,
    :album_id,
    :album,
    presence: true
  )

  validates :track_style, inclusion: TRACK_STYLE

  has_one :band,
  through: :album,
  source: :band

  belongs_to :album


end
