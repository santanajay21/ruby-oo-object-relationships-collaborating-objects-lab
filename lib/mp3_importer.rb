class MP3Importer

    attr_reader :path
  
      def initialize(path)
        @path = path
      end
  
      #files gets called by #import and returns an array
      #files turns the files paths into a string
      #then removes the directory part of the string
      def files
        @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
      end
  
      # #import takes each normalized filename and sends it to the Song class #new_by_filename
        #which creates a new song instance for each of the filenames
      # #import calls #files
      #so it is calling the method on the MP3Importer instance
      # #import is collaborating with Song instances by calling a Song method (new_by_filename) which creates a new song for every item in the array
      def import
        self.files.each{|file| Song.new_by_filename(file)}
      end
  end
  
  
  class Song
  
    attr_accessor :name, :artist
  
    def initialize(name)
      @name = name
    end
  
    def self.new_by_filename(file)
      song_name = file.split(" - ")[1]
      artist = file.split(" - ")[0]
      song = self.new(song_name)
      #this is calling the #artist_name=
      #it is a writer method that assigns that variable to artist
      #you are not just assigning the string to artist, because you want the artist attribute to be an artist instance instead
      song.artist_name = artist
      song
    end
  
    #this is a setter method, a writer,
    #it sets the artist attribute of the song instance equal to an artist instance (rather than just a string)
    #it calls a Class Method in Artist, that returns an artist object
    #the find_or_create_by_name either finds an existing artist and returns it, or creates a new object and returns it
    def artist_name=(name)
      self.artist = Artist.find_or_create_by_name(name)
      #after the artist instance is returned
      #this method calls the artist instance method #add_song
      #add_song adds this current song instance to the artist's song list
      self.artist.add_song(self)
    end
  
  end