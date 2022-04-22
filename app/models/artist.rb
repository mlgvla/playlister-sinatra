class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        self.name.downcase.gsub(" ", "-") #if there are any spaces in the name, hyphenate it
    end

    def self.find_by_slug(slug)
        #search through all the artists, slug each name and compare
        Artist.all.find {|artist| artist.slug == slug}
    end
end