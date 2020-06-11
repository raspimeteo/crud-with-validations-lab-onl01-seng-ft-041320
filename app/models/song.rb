class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, 
        presence: true, 
        if: :released?,
        uniqueness: true,
        inclusion: { in: 1900..Date.today.year }
    validates :artist_name, presence: true
end
