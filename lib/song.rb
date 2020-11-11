class Song 
    attr_accessor  :name,:artist

       @@all =[]

        def initialize(name=nil, artist =nil)
            @name =name
            @artist =artist
            @@all << self
        end


        def self.all
           @@all
        end


        def self.new_by_filename (filename)
            song = self.new
            song.name = filename.split("-")[1].strip
           artist  =  filename.split("-")[0].strip
            song.artist =Artist.find_or_create_by_name(artist)
            song

        end 

        def artist_name= (name)
            @artist = Artist.find_or_create_by_name(name)



        end



    end 


