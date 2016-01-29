# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  album_style :string           not null
#  band_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base

  ALBUM_STYLE = %w(live studio)

  validates(
    :name,
    :album_style,
    :band_id,
    :band,
    presence: true
  )

   validates :album_style, inclusion: ALBUM_STYLE

   has_many :tracks, dependent: :destroy

   belongs_to :band

end
