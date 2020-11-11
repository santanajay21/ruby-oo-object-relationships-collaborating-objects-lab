class Artist 
    attr_accessor  :name
    attr_reader :songs 
    @all = []
    
    
    
        def initialize(name)
            @name =name
            @songs = []
            @@all << self 
        end
    
        def self.all
            @@all
    
        end

    
    
        def save
            @@all << self 
            
        end

    
        def add_song(song)
            @songs << song
        end

    
       def self.find_or_create_by_name(artist_name)
            if self.all.find {|artist| artist.name == artist_name}
                return self.all.find {|artist| artist.name == artist_name}
            else
             artist_name = self.new(artist_name)
            end
        end
    
    
        def print_songs
           @songs.each {|song| puts song.name}
            # binding.pry 
        end 
    
    
    
    
    end 